package com.app.ruralworkers.util;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class LoggingModel {

    private String operation;
    private Object request;
    private Object response;
    private String errMessage;
    private String errCode;

}
