package com.dp.bigdata.taurus.core.structure;

/**
 * Author   mingdongli
 * 16/4/22  上午10:08.
 */
public class StringToBoolean implements StringTo<Boolean> {

    @Override
    public Boolean stringConvertTo(String lionValue) {
        return Boolean.parseBoolean(lionValue);
    }
}