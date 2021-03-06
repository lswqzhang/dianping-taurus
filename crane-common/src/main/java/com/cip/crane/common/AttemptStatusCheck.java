package com.cip.crane.common;

import com.cip.crane.common.parser.Operation;

/**
 * AttemptStatusCheck
 * 
 * @author damon.zhu
 * @see Operation
 */
public interface AttemptStatusCheck {

    /**
     * Check whether the <code>Operation</code> is finished.
     * 
     * @param operation
     * @return true if the operation finished, false otherwise.
     */
    public boolean isDone(Operation operation);
}
