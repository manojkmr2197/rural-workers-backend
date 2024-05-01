package com.app.ruralworkers.repository;

import com.app.ruralworkers.entity.City;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

public interface CityRepository extends JpaRepository<City, Long> {
}
