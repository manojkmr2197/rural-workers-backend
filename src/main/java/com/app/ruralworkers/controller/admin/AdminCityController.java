package com.app.ruralworkers.controller.admin;
import com.app.ruralworkers.dto.CityDTO;
import com.app.ruralworkers.service.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/admin/city")
public class AdminCityController {

    @Autowired
    private CityService cityService;

    @GetMapping(value = "/list")
    private ResponseEntity<?> getAllList() {

        List<CityDTO> cityList = cityService.getAllCities();

        return new ResponseEntity<Object>(cityList, HttpStatus.OK);

    }

//    @PostMapping
//    public void addCity(@RequestParam String cityName) {
//        cityService.addCity(cityName);
//    }
//
//    @DeleteMapping
//    public void removeCity(@RequestParam String cityName) {
//        cityService.removeCity(cityName);
//    }
}