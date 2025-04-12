package com.travel.ssm.blog.controller.home;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.travel.ssm.blog.entity.AccuWeatherResponse;
import com.travel.ssm.blog.entity.Temperature;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import static com.alibaba.fastjson.JSON.toJavaObject;

@RestController
@RequestMapping("/weather")
@CrossOrigin(origins = "*") // Allow cross-origin requests
public class GoWeatherController {

    private static final Logger LOGGER = Logger.getLogger(GoWeatherController.class.getName());
    private final String ACCUWEATHER_API_KEY = "FkIsbYodn41GuAY1OE2cMfYxpKXGxSNM";
    private final String ACCUWEATHER_BASE_URL = "http://dataservice.accuweather.com/currentconditions/v1/topcities/50";
    private final RestTemplate restTemplate;
    private final ObjectMapper objectMapper;

    public GoWeatherController() {
        this.restTemplate = new RestTemplate();
        this.objectMapper = new ObjectMapper();
    }

    @GetMapping("/top-cities")
    public ResponseEntity<?> getTopCitiesWeather() {
        try {
            LOGGER.info("Fetching top cities weather data");
            String url = UriComponentsBuilder.fromHttpUrl(ACCUWEATHER_BASE_URL)
                    .queryParam("apikey", ACCUWEATHER_API_KEY)
                    .toUriString();

            // First get the response as a string
            JSONArray jsonResponse = restTemplate.getForObject(url, JSONArray.class);
            
            if (jsonResponse == null || jsonResponse.isEmpty()) {
                LOGGER.warning("Empty response from AccuWeather API");
                return ResponseEntity.notFound().build();
            }

            List<AccuWeatherResponse> weatherList = new ArrayList<>();

            for (int i = 0; i < jsonResponse.size(); i++) {
                try {
                    JSONObject cityWeather = jsonResponse.getJSONObject(i);

                    AccuWeatherResponse weather = new AccuWeatherResponse();
                    
                    // Get basic properties with null checks
                    weather.setLocalizedName(cityWeather.getString("LocalizedName"));
                    weather.setWeatherText(cityWeather.getString("WeatherText"));
                    weather.setLocalObservationDateTime(cityWeather.getString("LocalObservationDateTime"));
                    
                    // Process temperature with proper error handling
                    if (cityWeather.containsKey("Temperature") && cityWeather.getJSONObject("Temperature") != null) {
                        Temperature temperature = cityWeather.getJSONObject("Temperature").toJavaObject(Temperature.class);
                        weather.setTemperature(temperature);
                    } else {
                        LOGGER.warning("Missing temperature data for city at index " + i);
                    }
                    
                    weatherList.add(weather);
                } catch (Exception e) {
                    LOGGER.log(Level.WARNING, "Error processing city at index " + i, e);
                    // Continue with the next city even if one fails
                }
            }
            // Log successful response
            LOGGER.info("Successfully fetched weather data for " + weatherList.size() + " cities");
            return ResponseEntity.ok(weatherList);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error fetching weather data", e);
            return ResponseEntity.badRequest()
                    .body("Error fetching weather data: " + e.getMessage());
        }
    }
} 