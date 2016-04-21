package com.dp.bigdata.taurus.core;

import java.text.ParseException;
import java.util.*;

import com.dp.bigdata.taurus.core.listener.GenericAttemptListener;
import com.dp.bigdata.taurus.core.listener.InitializedAttemptListener;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.dianping.cat.Cat;
import com.dp.bigdata.taurus.generated.mapper.TaskAttemptMapper;
import com.dp.bigdata.taurus.generated.module.Task;
import com.dp.bigdata.taurus.generated.module.TaskAttempt;
import com.dp.bigdata.taurus.generated.module.TaskAttemptExample;

/**
 * Triggle for Crontab Expression.
 * 
 * @author damon.zhu
 */
public class CrontabTriggle implements Triggle {

	private static final Log LOG = LogFactory.getLog(CrontabTriggle.class);

	@Autowired
	private TaskAttemptMapper attemptMapper;

	@Autowired
	private IDFactory idFactory;

	private final Scheduler scheduler;

	private List<InitializedAttemptListener> initializedAttemptListeners = new ArrayList<InitializedAttemptListener>();

	@Autowired
	public CrontabTriggle(Scheduler scheduler) {
		super();
		this.scheduler = scheduler;
	}

	public void triggle(final Date now) {
		Map<String, Task> tasks = scheduler.getAllRegistedTask();

		for (Task task : tasks.values()) {
			if (task.getStatus() != TaskStatus.RUNNING) {
				continue;
			}

			// validate the cron-expression
			CronExpression ce = null;
			try {
				ce = new CronExpression(task.getCrontab());
			} catch (ParseException e) {
				Cat.logError(
				      "Parse contab error for task id : " + task.getTaskid() + " when crontab string is : "
				            + task.getCrontab(), e);
				try {
					scheduler.suspendTask(task.getTaskid());
				} catch (ScheduleException ignore) {
				}
				continue;
			}

			// get the previous fire time and previous attempt
			Date previousFireTime = getPreviousFireTime(task, now);

			// for update the crontab expression
			if (previousFireTime.before(task.getUpdatetime())) {
				previousFireTime = task.getUpdatetime();
			}

			// iterator each fire time from last previousFireTime to current.
			Date nextFireTime = ce.getNextValidTimeAfter(previousFireTime);

			try {
                if(nextFireTime !=null){
                    while (nextFireTime.before(now)) {
                        String instanceID = idFactory.newInstanceID(task.getTaskid());
                        TaskAttempt attempt = new TaskAttempt();
                        String attemptID = idFactory.newAttemptID(instanceID);
                        attempt.setInstanceid(instanceID);
                        attempt.setTaskid(task.getTaskid());
                        attempt.setScheduletime(nextFireTime);
                        attempt.setStatus(AttemptStatus.INITIALIZED);
                        attempt.setAttemptid(attemptID);
                        attemptMapper.insert(attempt);
						for(InitializedAttemptListener listener : initializedAttemptListeners){
							listener.addInitializedAttempt(attempt);
						}
                        LOG.info(String.format("New attempt (%s) fired.", attemptID));
                        Cat.logEvent("Crontab.Fire", task.getName());
                        nextFireTime = ce.getNextValidTimeAfter(nextFireTime);
                    }
                }else {
                    Cat.logEvent("Crontab.NextFireTimeIsNULL", task.getName());
                }

			} catch (Throwable t) {
				Cat.logError(task.getName(), t);
			}
		}
	}

	@Override
	public void triggle() {
		triggle(new Date());
	}

	@Override
	public void triggle(Collection<TaskAttempt> taskAttempts) {
		throw new UnsupportedOperationException("not support");
	}

	@Override
	public void registerAttemptListener(GenericAttemptListener genericAttemptListener) {
		if(genericAttemptListener instanceof InitializedAttemptListener){
			initializedAttemptListeners.add((InitializedAttemptListener) genericAttemptListener);
		}
	}

	private Date getPreviousFireTime(final Task task, final Date now) {
		List<TaskAttempt> attempts = retrieveLatestTaskAttemptByTaskID(task.getTaskid());
		Date previousFireTime;
		// if it is the first time to execute this task, set time to now; otherwise set to the first attempt's schedule time.
		if (attempts == null || attempts.size() == 0) {
			Calendar lastExecDateCal = Calendar.getInstance();
			lastExecDateCal.setTime(now);
			lastExecDateCal.set(Calendar.MILLISECOND, 0);
			lastExecDateCal.set(Calendar.SECOND, 0);
			lastExecDateCal.add(Calendar.MINUTE, -1);
			previousFireTime = lastExecDateCal.getTime();
		} else {
			previousFireTime = attempts.get(0).getScheduletime();
		}

		// if lastScheduleTime is after previous schedule time, set previousFireTime = lastScheduleTime.
		Date lastScheduleTime = task.getLastscheduletime();
		if (lastScheduleTime != null && lastScheduleTime.after(previousFireTime)) {
			previousFireTime = lastScheduleTime;
		}
		return previousFireTime;
	}

	public List<TaskAttempt> retrieveLatestTaskAttemptByTaskID(String taskID) {
		TaskAttemptExample example = new TaskAttemptExample();
		example.or().andTaskidEqualTo(taskID);
		String orderByClause = "scheduleTime desc limit 1";
		example.setOrderByClause(orderByClause);
		return attemptMapper.selectByExample(example);
	}
}
