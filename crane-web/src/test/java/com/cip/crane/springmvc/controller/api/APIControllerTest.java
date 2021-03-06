package com.cip.crane.springmvc.controller.api;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URLEncodedUtils;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.params.ConnManagerParams;
import org.apache.http.conn.scheme.PlainSocketFactory;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.conn.tsccm.ThreadSafeClientConnManager;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.apache.http.util.EntityUtils;
import org.json.JSONException;
import org.json.JSONObject;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Author   mingdongli
 * 16/5/4  下午10:58.
 */
public class APIControllerTest {

    private static DefaultHttpClient httpclient;

    @Before
    public void setUp() throws Exception {
        HttpParams httpParams = new BasicHttpParams();
        ConnManagerParams.setTimeout(httpParams, 5000);
        HttpConnectionParams.setConnectionTimeout(httpParams, 10000);
        HttpConnectionParams.setSoTimeout(httpParams, 10000);
        SchemeRegistry registry = new SchemeRegistry();
        registry.register(new Scheme("http", PlainSocketFactory.getSocketFactory(), 80));
        registry.register(new Scheme("https", SSLSocketFactory.getSocketFactory(), 443));
        ClientConnectionManager cm = new ThreadSafeClientConnManager(httpParams, registry);
        httpclient = new DefaultHttpClient(cm, httpParams);
    }

    @Test
    public void testAddJob() throws Exception {
        httpAddJobPost("http://alpha.taurus.dp/api/job/addJob", "/api/job/addJob");

    }
//
//    @Test
//    public void testMscheduleAddJob() throws Exception {
//        httpMscheduleAddJobPost("http://localhost:8080/api/job/addJob", "/api/job/addJob");
//
//    }

    @Test
    public void testmodifyJob() throws Exception {
        httpModifyJobPost("http://alpha.taurus.dp/api/job/modifyJob", "/api/job/modifyJob");

    }

    @Test
    public void teststartJob() throws Exception {
        List<BasicNameValuePair> nvps = new ArrayList<BasicNameValuePair>();
        nvps.add(new BasicNameValuePair("jobId", "task_201605041836_0003"));
        httpStartJobPost("http://alpha.taurus.dp/api/job/startJob", nvps);

    }

    @Test
    public void testonceJob() throws Exception {
        List<BasicNameValuePair> nvps = new ArrayList<BasicNameValuePair>();
        nvps.add(new BasicNameValuePair("jobId", "task_201605041836_0003"));
        httpOnceJobPost("http://alpha.taurus.dp/api/job/onceJob", nvps);

    }

    @Test
    public void teststopJob() throws Exception {
        List<BasicNameValuePair> nvps = new ArrayList<BasicNameValuePair>();
        nvps.add(new BasicNameValuePair("jobId", "task_201605041836_0003"));
        httpStopJobPost("http://alpha.taurus.dp/api/job/stopJob", nvps);

    }
//
//    @Test
//    public void testmschedulestopJob() throws Exception {
//        List<BasicNameValuePair> nvps = new ArrayList<BasicNameValuePair>();
//        nvps.add(new BasicNameValuePair("jobId", "2"));
//        httpStopJobPost("http://alpha.taurus.dp/api/job/stopJob", nvps);
//    }

    @Test
    public void testgetJobTrace() throws Exception {
        List<BasicNameValuePair> nvps = new ArrayList<BasicNameValuePair>();
        nvps.add(new BasicNameValuePair("jobCodes", "taskTest1"));
        nvps.add(new BasicNameValuePair("offset", "1"));
        nvps.add(new BasicNameValuePair("limit", "1"));
        httpJobTraceJobGet("http://localhost:8080/api/job/getJobTrace", nvps);
    }

    @Test
    public void testjobList() throws Exception {
        List<BasicNameValuePair> nvps = new ArrayList<BasicNameValuePair>();
        nvps.add(new BasicNameValuePair("jobIds", "task_201605041836_0003,task_201605041742_0002"));
        httpJobListGet("http://alpha.taurus.dp/api/job/jobList", nvps);
    }

    @Test
    public void testquaryJobList() throws Exception {
        List<BasicNameValuePair> nvps = new ArrayList<BasicNameValuePair>();
        nvps.add(new BasicNameValuePair("taskid", "task_201605041836_0003"));
        nvps.add(new BasicNameValuePair("name", "addjobtest333"));
        nvps.add(new BasicNameValuePair("status", "1"));
        nvps.add(new BasicNameValuePair("creator", "mingdong.li"));
        httpQuaryJobListGet("http://alpha.taurus.dp/api/job/quaryJobList", nvps);
    }

    public static String httpQuaryJobListGet(String url, List<BasicNameValuePair> nvps) throws JSONException, IOException, InvalidKeyException, NoSuchAlgorithmException {

        //构造nvps为queryString
        if (nvps != null && nvps.size() > 0) {
            String query = URLEncodedUtils.format(nvps, "UTF-8");
            url += "?" + query;
        }
        HttpGet httpGet = new HttpGet(url);

        HttpEntity entity;
        String result;
        HttpResponse response = httpclient.execute(httpGet);
        entity = response.getEntity();
        InputStream ins = entity.getContent();
        result = IOUtils.toString(ins, "UTF-8");
        System.out.println(result);
        return result;
    }


    public static String httpOnceJobPost(String url, List<? extends NameValuePair> nvps) throws IOException {

        HttpPost httpPost = new HttpPost(url);
        httpPost.setEntity(new UrlEncodedFormEntity(nvps, "UTF-8"));

        HttpEntity entity = null;
        String result;
        HttpResponse response = httpclient.execute(httpPost);
        entity = response.getEntity();
        InputStream ins = entity.getContent();
        result = IOUtils.toString(ins, "UTF-8");
        System.out.printf(result);
        return result;
    }


    public static String httpStartJobPost(String url, List<? extends NameValuePair> nvps) throws IOException {

        HttpPost httpPost = new HttpPost(url);
        httpPost.setEntity(new UrlEncodedFormEntity(nvps, "UTF-8"));

        HttpEntity entity = null;
        String result;
        HttpResponse response = httpclient.execute(httpPost);
        entity = response.getEntity();
        InputStream ins = entity.getContent();
        result = IOUtils.toString(ins, "UTF-8");
        System.out.println(result);
        return result;
    }

    public static String httpStopJobPost(String url, List<? extends NameValuePair> nvps) throws IOException {

        HttpPost httpPost = new HttpPost(url);
        httpPost.setEntity(new UrlEncodedFormEntity(nvps, "UTF-8"));

        HttpEntity entity = null;
        String result;
        HttpResponse response = httpclient.execute(httpPost);
        entity = response.getEntity();
        InputStream ins = entity.getContent();
        result = IOUtils.toString(ins, "UTF-8");
        System.out.println(result);
        return result;
    }

    public static void httpModifyJobPost(String url, String uri) throws JSONException, IOException, InvalidKeyException, NoSuchAlgorithmException {

        HttpPost method = new HttpPost(url);


        // 接收参数json列表
        JSONObject jsonParam = new JSONObject();

        jsonParam.put("taskName", "addjobtest333");
        jsonParam.put("taskType", "default");
        jsonParam.put("taskCommand", "date");
        jsonParam.put("crontab", "0/35 * * * * ?");
        jsonParam.put("proxyUser", "nobady");
        jsonParam.put("maxExecutionTime", 60);
        jsonParam.put("maxWaitTime", 60);
        jsonParam.put("retryTimes", 0);
        jsonParam.put("creator", "mingdong.li");
        jsonParam.put("description", "");
        jsonParam.put("alertCondition", "");
        jsonParam.put("alertType", "");
        jsonParam.put("alertGroup", "");
        jsonParam.put("alertUser", "");
        jsonParam.put("taskUrl", "");
        jsonParam.put("mainClass", "");
        jsonParam.put("appName", "");
        jsonParam.put("iskillcongexp", false);
        jsonParam.put("hostName", "192.168.78.42");

        StringEntity entity = new StringEntity(jsonParam.toString(), "UTF-8");
        entity.setContentEncoding("UTF-8");
        entity.setContentType("application/json");
        method.setEntity(entity);

        System.out.println(jsonParam);
        HttpResponse result = httpclient.execute(method);

        String resData = EntityUtils.toString(result.getEntity());
        System.out.println(resData);
    }

    public static void httpMscheduleAddJobPost(String url, String uri) throws JSONException, IOException, InvalidKeyException, NoSuchAlgorithmException {

        HttpPost method = new HttpPost(url);


        // 接收参数json列表
        JSONObject jsonParam = new JSONObject();

        jsonParam.put("jobUniqueCode", "dianping1_arch1_testmingdong");
        jsonParam.put("jobCode", "testmingdong");
        jsonParam.put("jobName", "mingdongli-test1");
        jsonParam.put("expression", "0/13 * * * * ?");
        jsonParam.put("expressionType", "cron");
        jsonParam.put("jobGroup", "arch1");
        jsonParam.put("jobLine", "dianping1");
        jsonParam.put("jobOwner", "mingdong.li");
        jsonParam.put("port", "8420");
        jsonParam.put("maxExecuteTime", 30);
        jsonParam.put("taskNodes", "127.0.0.1");
        jsonParam.put("dbSchedule", 1);
        jsonParam.put("startNewJob", 1);
        jsonParam.put("alarmTimeInterval", 10);
        jsonParam.put("scheduleChannel", 1);
        jsonParam.put("scheduleState", 1);

        StringEntity entity = new StringEntity(jsonParam.toString(), "UTF-8");
        entity.setContentEncoding("UTF-8");
        entity.setContentType("application/json");
        method.setEntity(entity);

        System.out.println(jsonParam);
        HttpResponse result = httpclient.execute(method);

        String resData = EntityUtils.toString(result.getEntity());
        System.out.println(resData);
    }

    public static void httpAddJobPost(String url, String uri) throws JSONException, IOException, InvalidKeyException, NoSuchAlgorithmException {

        HttpPost method = new HttpPost(url);

        // 接收参数json列表
        JSONObject jsonParam = new JSONObject();

        jsonParam.put("taskName", "alpha-test-api-addjob2g");
        jsonParam.put("taskType", "default");
        jsonParam.put("taskCommand", "date");
        jsonParam.put("crontab", "0/13 * * * * ?");
        jsonParam.put("proxyUser", "nobady");
        jsonParam.put("maxExecutionTime", 60);
        jsonParam.put("maxWaitTime", 60);
        jsonParam.put("retryTimes", 0);
        jsonParam.put("creator", "mingdong.li");
        jsonParam.put("description", "");
        jsonParam.put("alertCondition", "");
        jsonParam.put("alertType", "");
        jsonParam.put("alertGroup", "");
        jsonParam.put("alertUser", "");
        jsonParam.put("taskUrl", "");
        jsonParam.put("mainClass", "");
        jsonParam.put("appName", "");
        jsonParam.put("iskillcongexp", false);
        jsonParam.put("hostName", "192.168.78.42");

        StringEntity entity = new StringEntity(jsonParam.toString(), "UTF-8");
        entity.setContentEncoding("UTF-8");
        entity.setContentType("application/json");
        method.setEntity(entity);

        System.out.println(jsonParam);
        HttpResponse result = httpclient.execute(method);

        String resData = EntityUtils.toString(result.getEntity());
        System.out.println(resData);
    }

    public String httpJobTraceJobGet(String url, List<? extends NameValuePair> nvps) throws IOException, InvalidKeyException, NoSuchAlgorithmException {
        //构造nvps为queryString
        if (nvps != null && nvps.size() > 0) {
            String query = URLEncodedUtils.format(nvps, "UTF-8");
            url += "?" + query;
        }
        HttpGet httpGet = new HttpGet(url);

        HttpEntity entity;
        String result;
        HttpResponse response = httpclient.execute(httpGet);
        entity = response.getEntity();
        InputStream ins = entity.getContent();
        result = IOUtils.toString(ins, "UTF-8");
        System.out.println(result);
        return result;
    }

    public String httpJobListGet(String url, List<? extends NameValuePair> nvps) throws IOException, InvalidKeyException, NoSuchAlgorithmException {
        //构造nvps为queryString
        if (nvps != null && nvps.size() > 0) {
            String query = URLEncodedUtils.format(nvps, "UTF-8");
            url += "?" + query;
        }
        HttpGet httpGet = new HttpGet(url);

        HttpEntity entity;
        String result;
        HttpResponse response = httpclient.execute(httpGet);
        entity = response.getEntity();
        InputStream ins = entity.getContent();
        result = IOUtils.toString(ins, "UTF-8");
        System.out.println(result);
        return result;
    }

    static class JobNotifyAlarmModel {
        private Integer id;//主键
        private String jobUniqueCode;//job唯一码
        private String mis;//mis号
        private Integer daxiang;//是否发大象
        private Integer email;//是否发邮件
        private Integer phone;//是否发短信
        private Date gmtCreate;//创建时间
        private Date gmtModified;//更新时间

        public Integer getId() {
            return id;
        }

        public void setId(Integer id) {
            this.id = id;
        }

        public String getJobUniqueCode() {
            return jobUniqueCode;
        }

        public void setJobUniqueCode(String jobUniqueCode) {
            this.jobUniqueCode = jobUniqueCode;
        }

        public String getMis() {
            return mis;
        }

        public void setMis(String mis) {
            this.mis = mis;
        }

        public Integer getDaxiang() {
            return daxiang;
        }

        public void setDaxiang(Integer daxiang) {
            this.daxiang = daxiang;
        }

        public Integer getEmail() {
            return email;
        }

        public void setEmail(Integer email) {
            this.email = email;
        }

        public Integer getPhone() {
            return phone;
        }

        public void setPhone(Integer phone) {
            this.phone = phone;
        }

        public Date getGmtCreate() {
            return gmtCreate;
        }

        public void setGmtCreate(Date gmtCreate) {
            this.gmtCreate = gmtCreate;
        }

        public Date getGmtModified() {
            return gmtModified;
        }

        public void setGmtModified(Date gmtModified) {
            this.gmtModified = gmtModified;
        }
    }
}