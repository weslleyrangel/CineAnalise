package com.example.CineAnalise.repository;


import com.example.CineAnalise.model.Analise;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface AnaliseRepository extends JpaRepository<Analise, Long>{
}
   