package com.nicolas.belttwo.repositories;

import com.nicolas.belttwo.models.Tablet;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

public interface TabletRepository extends CrudRepository<Tablet, Long> {
    List<Tablet> findAll();
}
