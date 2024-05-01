package com.app.ruralworkers.controller.admin;

import com.app.ruralworkers.entity.City;
import com.app.ruralworkers.util.LoggingModel;
import com.app.ruralworkers.service.CityService;
import com.app.ruralworkers.util.LoggingUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/v1/admin/city")
public class AdminCityController {

    @Autowired
    private CityService cityService;

    @GetMapping(value = "/list")
    private ResponseEntity<?> getAllList() {
        LoggingModel logging =new LoggingModel();
        logging.setOperation("ADMIN-CITY-ALL");
        try {
            List<City> cityList = cityService.getAllCities();
            logging.setResponse(cityList);
            return new ResponseEntity<Object>(cityList, HttpStatus.OK);
        }catch (Exception e){
            logging.setErrCode("500");
            logging.setErrMessage(e.getMessage());
            return new ResponseEntity<Object>(new ArrayList<>(), HttpStatus.INTERNAL_SERVER_ERROR);
        }finally {
            LoggingUtils.writeLogFile(logging);
        }
    }

    @PostMapping(value = "/add")
    public ResponseEntity<?> addCity(@RequestBody City city) {
        LoggingModel logging =new LoggingModel();
        logging.setOperation("ADMIN-CITY-ADD");
        try {
            City status = cityService.addCity(city);
            logging.setResponse(status);
            return new ResponseEntity<Object>(status, HttpStatus.OK);
        }catch (Exception e){
            logging.setErrCode("500");
            logging.setErrMessage(e.getMessage());
            return new ResponseEntity<Object>(new ArrayList<>(), HttpStatus.INTERNAL_SERVER_ERROR);
        }finally {
            LoggingUtils.writeLogFile(logging);
        }
    }

//    @DeleteMapping
//    public void removeCity(@RequestParam String cityName) {
//        cityService.removeCity(cityName);
//    }
}
