package com.app.ruralworkers.service;

import com.app.ruralworkers.entity.City;
import com.app.ruralworkers.repository.CityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("CityService")
//@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class CityServiceImpl implements CityService{

    @Autowired
    private CityRepository cityRepository;
    @Override
    public List<City> getAllCities() {
        return cityRepository.findAll();
    }

    @Override
    public City addCity(City city) {
        return cityRepository.save(city);
    }

//    public List<String> getAllCities() {
//        String sql = "SELECT city_name FROM city";
//        return jdbcTemplate.queryForList(sql, String.class);
//    }
//
//    public void addCity(String cityName) {
//        String sql = "INSERT INTO city (city_name) VALUES (?)";
//        jdbcTemplate.update(sql, cityName);
//    }
//
//    public void removeCity(String cityName) {
//        String sql = "DELETE FROM city WHERE city_name = ?";
//        jdbcTemplate.update(sql, cityName);
//    }
}
