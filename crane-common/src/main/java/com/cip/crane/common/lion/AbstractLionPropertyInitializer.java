package com.cip.crane.common.lion;

import com.cip.crane.common.structure.Converter;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Author   mingdongli
 * 16/4/21  下午08:52.
 */
public abstract class AbstractLionPropertyInitializer<T> implements InitializingBean, ConfigChangeListener {

    protected final Log logger = LogFactory.getLog(getClass());

    protected T lionValue;

    protected Converter<T> converter;

    @Autowired
    protected LionDynamicConfig lionDynamicConfig;

    @Override
    public void afterPropertiesSet() throws Exception {

        converter = getConvert();

        try {
            String value = lionDynamicConfig.get(getKey());
            lionValue = converter.convertTo(value);
        } catch (Exception e) {
            //lion无法获取值，或者转换失败取默认值
            lionValue = getDefaultValue();
        }
        logger.info(getClass().getSimpleName() + " : Init [lionValue] to " + lionValue);

        lionDynamicConfig.addConfigChangeListener(this);
    }

    @Override
    public void onConfigChange(String key, String value) throws Exception {

        if (key != null && key.equals(getKey())) {
            logger.info("[onChange][" + getKey() + "]" + value);
            lionValue = converter.convertTo(value.trim());
        } else {
            logger.info("not match");
        }
    }

    protected abstract String getKey();

    protected abstract T getDefaultValue();

    protected abstract Converter<T> getConvert();
}
