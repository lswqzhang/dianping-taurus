package com.dp.bigdata.taurus.core;

import com.dianping.cat.Cat;
import com.dianping.lion.EnvZooKeeperConfig;
import com.dianping.lion.client.ConfigCache;
import com.dianping.lion.client.LionException;
import com.dp.bigdata.taurus.alert.MailHelper;
import com.dp.bigdata.taurus.alert.WeChatHelper;
import com.dp.bigdata.taurus.core.listener.DependPassAttemptListener;
import com.dp.bigdata.taurus.core.listener.GenericAttemptListener;
import com.dp.bigdata.taurus.lion.ConfigHolder;
import com.dp.bigdata.taurus.lion.LionKeys;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * MultiInstanceFilter
 *
 * @author damon.zhu
 */
public class MultiInstanceFilter implements Filter {

    private Filter next;

    private Scheduler scheduler;

    public static HashMap<String, Integer> jobAlert = new HashMap<String, Integer>();

    private List<DependPassAttemptListener> dependPassAttemptListeners = new ArrayList<DependPassAttemptListener>();

    private static final int ALERT_SILENCE_MAX_COUNT = 30;

    @Autowired
    public MultiInstanceFilter(Scheduler scheduler) {
        this.scheduler = scheduler;
    }

    public List<AttemptContext> filter(List<AttemptContext> contexts) {
        HashMap<String, AttemptContext> maps = new HashMap<String, AttemptContext>();

        for (AttemptContext context : contexts) {
            List<AttemptContext> runnings = scheduler.getRunningAttemptsByTaskID(context.getTaskid());
            AttemptContext ctx = maps.get(context.getTaskid());

            if (runnings != null && runnings.size() > 0) {
            	//TODO 根据用户设置，决定是否设置拥塞的任务调度的新调度为过期状态，不执行（待测试）
            	if(context.getTask().getIskillcongexp()){
					scheduler.ExpireCongestionAttempt(context.getAttemptid());
            		continue;
            	}
                // 拥堵了~应该告警用户任务堵住了~
                Integer jobAlertCount = null;
                if (jobAlert.containsKey(context.getTaskid())) {
                    jobAlertCount = jobAlert.get(context.getTaskid());
                }

                if (null == jobAlertCount) {
                    jobAlert.put(context.getTaskid(), 0);
                } else if (jobAlertCount == 0) {
                    String notAlertJobs;
                    try {
                        notAlertJobs = ConfigCache.getInstance(EnvZooKeeperConfig.getZKAddress()).getProperty("taurus.web.taskblock.notalert");
                    } catch (LionException e) {
                        notAlertJobs = "";
                    }
                    boolean needAlert = true;
                    if (StringUtils.isNotBlank(notAlertJobs)) {

                        String[] notAlertLists = notAlertJobs.split(",");

                        for (String notalert : notAlertLists) {
                            if (notalert.equals(context.getName())) {
                                needAlert = false;
                                break;
                            }
                        }
                    }

                    if (needAlert) {
                    	// 告警加入domain
                    	String domain = null;
                    	try {
                    		domain = ConfigCache.getInstance(EnvZooKeeperConfig.getZKAddress()).getProperty("taurus.web.serverName");
                        } catch (LionException e) {
                        	domain = "http://taurus.dp";
                        	e.printStackTrace();
                        }
                        String alertontext = "您好，你的Taurus Job【" 
                        					+ context.getTask().getName() 
                        					+ "】发生拥堵，请及时关注，谢谢~"
                        					+ "作业调度历史：" 
                        					+ domain 
                        					+ "/attempt?taskID=" 
                        					+ context.getTaskid();
                        try {
                        	String alertAdmin = ConfigHolder.get(LionKeys.CONGESTION_ADMIN_USER);
                        	WeChatHelper.sendWeChat(alertAdmin, alertontext, "Taurus-Job拥塞告警服务", ConfigHolder.get(LionKeys.ADMIN_WECHAT_AGENTID));
                            WeChatHelper.sendWeChat(context.getCreator(), alertontext, "Taurus-Job拥塞告警服务", "12");
                            MailHelper.sendMail(context.getCreator() + "@dianping.com", alertontext, "Taurus-Job拥塞告警服务");

                        } catch (Exception e) {
                            Cat.logError(e);
                        }
                    }


                    jobAlert.put(context.getTaskid(), jobAlertCount + 1);

                } else {
                    jobAlert.put(context.getTaskid(), jobAlertCount + 1);
                }

            } else {

                Integer jobAlertCount = null;
                if (jobAlert.containsKey(context.getTaskid())) {
                    jobAlertCount = jobAlert.get(context.getTaskid());
                }

                if (jobAlertCount != null) {
                    //如果超出了静默告警数，者清除MAP中得count，就会重新告警一次，默认每20个拥堵告警一次
                    if (jobAlertCount >= ALERT_SILENCE_MAX_COUNT) {
                        jobAlert.remove(context.getTaskid());
                    }
                }
                //这里控制同时只有一个执行
                if (ctx == null) {
                    maps.put(context.getTaskid(), context);
                    //将要被调度，进入Running状态，避免多次调度所以需要移除
                    for(DependPassAttemptListener listener : dependPassAttemptListeners){
                        listener.removeDependPassAttempt(context.getAttempt());
                    }
                }
            }
        }

        List<AttemptContext> results = new ArrayList<AttemptContext>();
        for (AttemptContext context : maps.values()) {
            results.add(context);
        }

        if (next != null) {
            return next.filter(results);
        } else {
            return results;
        }
    }

    @Override
    public void registerAttemptListener(GenericAttemptListener genericAttemptListener) {
        if(genericAttemptListener instanceof DependPassAttemptListener){
            dependPassAttemptListeners.add((DependPassAttemptListener) genericAttemptListener);
        }
    }

    public Filter getNext() {
        return next;
    }

    public void setNext(Filter next) {
        this.next = next;
    }

}