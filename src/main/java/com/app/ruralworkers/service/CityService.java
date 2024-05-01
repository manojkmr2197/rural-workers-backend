package com.app.ruralworkers.service;

import com.app.ruralworkers.entity.City;

import java.util.List;

public interface CityService {
    List<City> getAllCities();

    City addCity(City city);
}
