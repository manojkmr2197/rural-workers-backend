package com.app.ruralworkers.dao;

import com.app.ruralworkers.Entity.City;
import com.app.ruralworkers.constants.QueryConstants;
import com.app.ruralworkers.dto.CityDTO;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

@Repository("CityDao")
@Transactional
public class CityDaoImpl implements CityDao{
    @Autowired
    private SessionFactory sessionFactory;
    @Override
    public List<CityDTO> getAllCities() {
        // TODO Auto-generated method stub

        List<CityDTO> cityList = new ArrayList<CityDTO>();


        Query cityListQuery = sessionFactory.getCurrentSession().createQuery(QueryConstants.CITY_ALL_QUERY);
        List<City> l_CityList = (List<City>) cityListQuery.getResultList();

        for (City cityObj : l_CityList) {
            cityList.add(new CityDTO(cityObj));

        }

        return cityList;
    }
}
