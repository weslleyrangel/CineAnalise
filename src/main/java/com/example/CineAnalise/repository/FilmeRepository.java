package com.example.CineAnalise.repository;

import com.example.CineAnalise.model.Filme;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FilmeRepository extends JpaRepository<Filme, Long> {
}
