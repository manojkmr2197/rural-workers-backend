package com.app.ruralworkers.dto;

import com.app.ruralworkers.Entity.City;
public class CityDTO {
    private int city_id;
    private String city_name_english;
    private String city_name_tamil;

    public CityDTO(int city_id, String city_name_english,String city_name_tamil) {
        this.city_id = city_id;
        this.city_name_english = city_name_english;
        this.city_name_tamil = city_name_tamil;
    }

    public CityDTO(City cityObj) {
        this.city_id = cityObj.getCITY_ID();
        this.city_name_english = cityObj.getCITY_NAME_ENGLISH();
        this.city_name_tamil = cityObj.getCITY_NAME_TAMIL();
    }

    public int getCity_id() {
        return city_id;
    }

    public void setCity_id(int city_id) {
        this.city_id = city_id;
    }

    public String getCity_name_english() {
        return city_name_english;
    }

    public void setCity_name_english(String city_name_english) {
        this.city_name_english = city_name_english;
    }

    public String getCity_name_tamil() {
        return city_name_tamil;
    }

    public void setCity_name_tamil(String city_name_tamil) {
        this.city_name_tamil = city_name_tamil;
    }
}
