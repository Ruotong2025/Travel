package com.travel.ssm.blog.entity;

import lombok.Data;
import com.amadeus.resources.HotelOfferSearch.Offer;
import java.util.List;

@Data
public class HotelSearchResult {
    private String name;
    private String hotelId;
    private String chainCode;
    private String brandCode;
    private String cityCode;
    private double latitude;
    private double longitude;
    private double distance;
    private int rating;
    private String checkInDate;
    private String checkOutDate;
    private int adults;
    private String description;
    private Offer[] offers;
    private Amenity[] amenities;
} 