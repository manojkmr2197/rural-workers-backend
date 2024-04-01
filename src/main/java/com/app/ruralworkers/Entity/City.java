package com.app.ruralworkers.entity;

import lombok.Data;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;


@Data
@Entity
@DynamicUpdate
@Table(name = "CITY")
public class City {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "CITY_ID")
    private Integer cityId;

    @Column(name = "CITY_NAME_ENGLISH")
    private String cityNameEnglish;

    @Column(name = "CITY_NAME_TAMIL")
    private String cityNameTamil;

}
