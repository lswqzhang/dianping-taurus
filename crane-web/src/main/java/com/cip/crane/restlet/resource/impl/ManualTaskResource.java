package com.cip.crane.restlet.resource.impl;

import com.cip.crane.restlet.resource.IManualTaskResource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.restlet.data.Status;
import org.restlet.resource.ServerResource;
import org.springframework.beans.factory.annotation.Autowired;

import com.cip.crane.common.ScheduleException;
import com.cip.crane.common.Scheduler;
import com.cip.crane.common.TaskID;

/**
 * Resource url : http://xxx.xxx/api/manualtask/{task_id}
 * 
 * @author damon.zhu
 */
public class ManualTaskResource extends ServerResource implements IManualTaskResource {

    private static final Log LOG = LogFactory.getLog(LogResource.class);
    private static final int EXECUTE = 1;
    private static final int SUSPEND = 2;
    private static final int RESUME = 3;

    @Autowired
    private Scheduler scheduler;

    @Override
    public void start() {
        setStatus(action(EXECUTE));
    }

    @Override
    public void resume() {
        setStatus(action(RESUME));
    }

    @Override
    public void suspend() {
        setStatus(action(SUSPEND));
    }

    private Status action(int action) {
        String taskID = (String) getRequest().getAttributes().get("task_id");

        try {
            TaskID.forName(taskID);
        } catch (Exception e) {
            LOG.info(e.getMessage());
            return Status.CLIENT_ERROR_BAD_REQUEST;
        }

        try {
            if (action == EXECUTE){
                scheduler.executeTask(taskID, 0);
            }else if(action == SUSPEND){
                scheduler.suspendTask(taskID);
            }else if(action == RESUME){
                scheduler.resumeTask(taskID);
            } else {
                return Status.CLIENT_ERROR_BAD_REQUEST;
            }
            return Status.SUCCESS_OK;
        } catch (ScheduleException se) {
            LOG.error(se.getMessage(), se);
            return Status.SERVER_ERROR_INTERNAL;
        }
    }

}
