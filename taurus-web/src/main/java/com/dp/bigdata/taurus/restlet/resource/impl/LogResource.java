package com.dp.bigdata.taurus.restlet.resource.impl;

import java.io.File;

import com.dp.bigdata.taurus.restlet.resource.ILogResource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.restlet.data.MediaType;
import org.restlet.data.Status;
import org.restlet.representation.FileRepresentation;
import org.restlet.resource.Get;
import org.restlet.resource.ServerResource;
import org.springframework.beans.factory.annotation.Autowired;

import com.dp.bigdata.taurus.core.ScheduleException;
import com.dp.bigdata.taurus.core.Scheduler;

/**
 * Resource url : http://xxx.xxx/api/attempt/{attempt_id}
 * 
 * @author damon.zhu
 */
public class LogResource extends ServerResource implements ILogResource {

    private static final Log LOG = LogFactory.getLog(LogResource.class);

    @Autowired
    private Scheduler scheduler;


    @Override
    public void kill() {
        String attemptID = (String) getRequest().getAttributes().get("attempt_id");

        if (attemptID.split("_").length != 5) {
            setStatus(Status.CLIENT_ERROR_BAD_REQUEST);
            return;
        }

        boolean isRunning = scheduler.isRuningAttempt(attemptID);

        if (!isRunning) {
            setStatus(Status.CLIENT_ERROR_CONFLICT);
            return;
        }

        try {
            scheduler.killAttempt(attemptID);
        } catch (ScheduleException se) {
            LOG.error(se.getMessage(), se);
            setStatus(Status.SERVER_ERROR_INTERNAL);
        }

    }


}
