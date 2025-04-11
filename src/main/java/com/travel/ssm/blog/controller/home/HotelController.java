package com.travel.ssm.blog.controller.home;

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.Hotel;
import com.amadeus.resources.HotelOfferSearch;
import com.amadeus.resources.HotelOfferSearch.Offer;
import com.travel.ssm.blog.entity.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/hotel")
public class HotelController {

    private static final String AMADEUS_API_KEY = "W4KFP45SFRj4RIsEzg8GKVA67iIEf6OY";
    private static final String AMADEUS_API_SECRET = "H90UJJ9p9xgu6QpA";
    private static final int PAGE_SIZE = 10;

    @GetMapping("/search")
    public String searchHotels(
            @RequestParam String cityCode,
            @RequestParam(defaultValue = "5") int radius,
            @RequestParam int rating,
            @RequestParam int adults,
            @RequestParam String checkInDate,
            @RequestParam String checkOutDate,
            @RequestParam(defaultValue = "10") int hotels,
            @RequestParam(defaultValue = "1") int page,
            Model model) {

        // 创建Amadeus客户端
        Amadeus amadeus = Amadeus
                .builder(AMADEUS_API_KEY, AMADEUS_API_SECRET)
                .setLogLevel("debug")
                .setHostname("test")
                .build();

        List<Hotel> hotelList = new ArrayList<>();
        int totalPages = 0;

        try {
            // 使用酒店列表API获取酒店ID
            Hotel[] hotelsArray = amadeus.referenceData.locations.hotels.byCity.get(
                    Params.with("cityCode", cityCode.toUpperCase())
                            .and("radius", radius)
                            .and("radiusUnit", "KM")
                            .and("ratings", rating)
                            .and("hotelSource", "ALL")
            );

            if (hotelsArray == null || hotelsArray.length == 0) {
                model.addAttribute("error", "No hotels found");
                return "Home/hotel/search";
            }

            // 计算总页数
            totalPages = (int) Math.ceil((double) hotelsArray.length / PAGE_SIZE);
            if (page < 1 || page > totalPages) {
                model.addAttribute("error", "Invalid page number");
                return "Home/hotel/search";
            }

            // 计算当前页的起始和结束索引
            int startIndex = (page - 1) * PAGE_SIZE;
            int endIndex = Math.min(startIndex + PAGE_SIZE, hotelsArray.length);

            // 获取当前页的酒店
            for (int i = startIndex; i < endIndex; i++) {
                hotelList.add(hotelsArray[i]);
            }

        } catch (ResponseException e) {
            model.addAttribute("error", "Error occurred while searching hotels: " + e.getMessage());
            return "Home/hotel/search";
        }

        // 添加结果到模型
        model.addAttribute("hotelList", hotelList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("cityCode", cityCode);
        model.addAttribute("radius", radius);
        model.addAttribute("rating", rating);
        model.addAttribute("adults", adults);
        model.addAttribute("checkInDate", checkInDate);
        model.addAttribute("checkOutDate", checkOutDate);
        model.addAttribute("hotels", hotels);

        return "Home/hotel/search";
    }

    @GetMapping("/details")
    @ResponseBody
    public HotelSearchResult getHotelDetails(
            @RequestParam String hotelId,
            @RequestParam String checkInDate,
            @RequestParam String checkOutDate,
            @RequestParam int adults) {

        // 创建Amadeus客户端
        Amadeus amadeus = Amadeus
                .builder(AMADEUS_API_KEY, AMADEUS_API_SECRET)
                .setLogLevel("debug")
                .setHostname("test")
                .build();

        try {
            // 使用酒店搜索API获取酒店报价
            HotelOfferSearch[] offers = amadeus.shopping.hotelOffersSearch.get(
                    Params.with("hotelIds", hotelId)
                            .and("checkInDate", checkInDate)
                            .and("checkOutDate", checkOutDate)
                            .and("adults", adults)
                            .and("paymentPolicy", "NONE")
                            .and("bestRateOnly", "true")
            );

            if (offers != null && offers.length > 0 && offers[0] != null && offers[0].getHotel() != null) {
                HotelSearchResult result = new HotelSearchResult();
                result.setName(offers[0].getHotel().getName());
                result.setHotelId(hotelId);
                result.setOffers(offers[0].getOffers());
                return result;
            }
        } catch (ResponseException e) {
            e.printStackTrace();
        }

        return null;
    }

    @GetMapping("/search/form")
    public String showSearchForm(Model model) {
        // 设置默认值
        model.addAttribute("radius", 5);
        model.addAttribute("rating", 5);
        model.addAttribute("adults", 1);
        model.addAttribute("hotels", 10);
        return "Home/hotel/search";
    }
}
