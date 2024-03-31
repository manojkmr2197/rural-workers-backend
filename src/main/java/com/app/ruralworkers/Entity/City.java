package com.app.ruralworkers.Entity;

import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;



@Entity
@DynamicUpdate
@Table(name = "CITY")
public class City implements Serializable {

    private static final long serialVersionUID = 6774967704284314486L;

    @Id
    @Column(name = "CITY_ID")
    private int CITY_ID;

    @Column(name = "CITY_NAME_ENGLISH")
    private String CITY_NAME_ENGLISH;
    @Column(name = "CITY_NAME_TAMIL")
    private String CITY_NAME_TAMIL;
    public int getCITY_ID() {
        return CITY_ID;
    }

    public void setCITY_ID(int CITY_ID) {
        this.CITY_ID = CITY_ID;
    }

    public String getCITY_NAME_ENGLISH() {
        return CITY_NAME_ENGLISH;
    }

    public void setCITY_NAME_ENGLISH(String CITY_NAME_ENGLISH) {
        this.CITY_NAME_ENGLISH = CITY_NAME_ENGLISH;
    }

    public String getCITY_NAME_TAMIL() {
        return CITY_NAME_TAMIL;
    }

    public void setCITY_NAME_TAMIL(String CITY_NAME_TAMIL) {
        this.CITY_NAME_TAMIL = CITY_NAME_TAMIL;
    }
}
