package com.travel.ssm.blog.entity;

import lombok.Data;

@Data
public class TimeZone {
    private String Code;
    private String Name;
    private double GmtOffset;
    private boolean IsDaylightSaving;
    private String NextOffsetChange;
}
