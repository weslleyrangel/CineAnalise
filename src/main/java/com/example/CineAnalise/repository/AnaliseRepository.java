package com.example.CineAnalise.repository;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;
import java.util.stream.Collectors;

import org.springframework.stereotype.Repository;

import com.example.CineAnalise.model.Analise;

@Repository
public class AnaliseRepository {
    private final List<Analise> analises = new ArrayList<>();
    private final AtomicLong idCounter = new AtomicLong();

    public AnaliseRepository() {
        // Dados de exemplo
        save(new Analise() {{
            setFilmeId(1L);
            setNota(5);
            setTexto("Revolucionou o cinema dos anos 90.");
        }});
    }

    public List<Analise> findByFilmeId(Long filmeId) {
        return analises.stream()
                .filter(a -> a.getFilmeId().equals(filmeId))
                .collect(Collectors.toList());
    }

    public Analise save(Analise analise) {
        if (analise.getId() == null) {
            analise.setId(idCounter.incrementAndGet());
        }
        analises.add(analise);
        return analise;
    }
}
