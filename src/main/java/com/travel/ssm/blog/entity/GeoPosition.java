package com.travel.ssm.blog.entity;

import lombok.Data;

@Data
public class GeoPosition {
    private double Latitude;
    private double Longitude;
    private Elevation Elevation;
}
