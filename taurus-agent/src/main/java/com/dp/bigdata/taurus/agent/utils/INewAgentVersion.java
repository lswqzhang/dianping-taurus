package com.dp.bigdata.taurus.agent.utils;

import org.restlet.resource.Get;

/**
 * Created by mkirin on 14-8-12.
 */
public interface INewAgentVersion {
    @Get
    public String retrieve() ;
}
