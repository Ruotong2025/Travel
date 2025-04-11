package com.travel.ssm.blog.controller.home;

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.Hotel;
import com.amadeus.resources.HotelOfferSearch;
import com.travel.ssm.blog.entity.Result;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/hotel")
public class HotelController {

    private static final String AMADEUS_API_KEY = "W4KFP45SFRj4RIsEzg8GKVA67iIEf6OY";
    private static final String AMADEUS_API_SECRET = "H90UJJ9p9xgu6QpA";
    private static final int PAGE_SIZE = 10;

    @GetMapping("/search")
    public Result searchHotels(
            @RequestParam(defaultValue = "PAR") String cityCode,
            @RequestParam(defaultValue = "5") int radius,
            @RequestParam(defaultValue = "5") int rating,
            @RequestParam(defaultValue = "1") int adults,
            @RequestParam(defaultValue = "2024-12-01") String checkInDate,
            @RequestParam(defaultValue = "2024-12-02") String checkOutDate,
            @RequestParam(defaultValue = "10") int hotels,
            @RequestParam(defaultValue = "1") int page) {

        // 创建Amadeus客户端
        Amadeus amadeus = Amadeus
                .builder(AMADEUS_API_KEY, AMADEUS_API_SECRET)
                .setLogLevel("debug")
                .setHostname("test")
                .build();

        try {
            // 使用酒店列表API获取酒店ID
            Hotel[] hotelList = amadeus.referenceData.locations.hotels.byCity.get(
                    Params.with("cityCode", cityCode.toUpperCase())
                            .and("radius", radius)
                            .and("radiusUnit", "KM")
                            .and("ratings", rating)
                            .and("hotelSource", "ALL")
            );

            if (hotelList == null || hotelList.length == 0) {
                return Result.create(400, "No hotels found");
            }

            // 计算总页数
            int totalPages = (int) Math.ceil((double) hotelList.length / PAGE_SIZE);
            if (page < 1 || page > totalPages) {
                return Result.create(400, "Invalid page number");
            }

            // 计算当前页的起始和结束索引
            int startIndex = (page - 1) * PAGE_SIZE;

            // 获取当前页的酒店ID
            String[] hotelIds = Arrays.stream(hotelList)
                    .skip(startIndex)
                    .limit(PAGE_SIZE)
                    .map(Hotel::getHotelId)
                    .filter(id -> id != null && !id.isEmpty())
                    .toArray(String[]::new);

            // 1. 使用酒店搜索API直接获取酒店报价
            HotelOfferSearch[] offers = amadeus.shopping.hotelOffersSearch.get(
                    Params.with("hotelIds", hotelIds)
                            .and("checkInDate", checkInDate)
                            .and("checkOutDate", checkOutDate)
                            .and("adults", adults)
                            .and("paymentPolicy", "NONE")
                            .and("bestRateOnly", "true")
            );
            if (hotelIds.length == 0) {
                return Result.create(400, "No valid hotel IDs found");
            }
        } catch (ResponseException e) {
            throw new RuntimeException(e);
        } finally {

        }
        return null;
    }
}
