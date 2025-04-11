package com.travel.ssm.blog.entity;

import lombok.Data;

@Data
public class HotelSearchResult {
    private String name;
    private String cityCode;
    private int rating;
    private String checkInDate;
    private String checkOutDate;
    private int adults;
    private String description;
    private Price price;

    @Data
    public static class Price {
        private String currency;
        private String total;
        private String base;
    }
} 