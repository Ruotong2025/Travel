package com.travel.ssm.blog.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class AccuWeatherResponse {
    private String Key;
    private String LocalizedName;
    private String EnglishName;
    private Country Country;
    private TimeZone TimeZone;
    private GeoPosition GeoPosition;
    private String LocalObservationDateTime;
    private long EpochTime;
    private String WeatherText;
    private int WeatherIcon;
    private boolean HasPrecipitation;
    private String PrecipitationType;
    private boolean IsDayTime;
    private Temperature Temperature;
    private String MobileLink;
    private String Link;
}
