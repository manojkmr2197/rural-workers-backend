package com.app.ruralworkers.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.apache.commons.lang3.StringUtils;



public class LoggingUtils {

    private static final Logger LOGGER =
            LoggerFactory.getLogger(LoggingUtils.class);

    public static void writeLogFile(LoggingModel loggingModel) {

        if (loggingModel != null && !StringUtils.isBlank(loggingModel.getErrMessage())){
            LOGGER.error("Exception : {} ",loggingModel);
        }else{
            LOGGER.info("Message : {} ",loggingModel);
        }
    }
}
