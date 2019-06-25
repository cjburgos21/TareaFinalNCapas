package com.uca.capas.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.uca.capas.domain.Sucursal;

@Repository
public interface SucursalRepository extends JpaRepository<Sucursal,Integer>{

	public List<Sucursal> findAll();
	
	public Sucursal getOne(Integer dato);
	
}
