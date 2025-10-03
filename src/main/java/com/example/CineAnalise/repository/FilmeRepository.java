package com.example.CineAnalise.repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicLong;

import org.springframework.stereotype.Repository;

import com.example.CineAnalise.model.Filme;

@Repository
public class FilmeRepository {

    private final List<Filme> filmes = new ArrayList<>();
    private final AtomicLong idCounter = new AtomicLong();

    public FilmeRepository() {
        // Dados de exemplo
        save(new Filme() {
            {
                setTitulo("Naruto");
                setSinopse("\"Naruto\" é um anime baseado no mangá de Masashi Kishimoto, que segue a jornada de Naruto Uzumaki, um jovem ninja que sonha em se tornar Hokage, o líder mais forte de sua vila.");
                setGenero("Shōnen, Ação, Aventura, Ninjas");
                setAno(2002);
            }
        });
        save(new Filme() {
            {
                setTitulo("Neo Genesis Evangelion");
                setSinopse("Quando os Anjos começam a atacar o planeta Terra no ano de 2015, apenas um punhado de pilotos de EVA de 14 anos são capazes de detê-los. O jovem Shinji Ikari de repente se vê forçado a pilotar o EVA-01, um mecha orgânico gigante, projetado e construído pela NERV, que é a única coisa que pode parar os Anjos.");
                setGenero("Apocalítico,Drama psicológico,Mecha");
                setAno(1995);
            }
        });
    }

    public List<Filme> findAll() {
        return filmes;
    }

    public Optional<Filme> findById(Long id) {
        return filmes.stream().filter(f -> f.getId().equals(id)).findFirst();
    }

    public Filme save(Filme filme) {
        if (filme.getId() == null) {
            filme.setId(idCounter.incrementAndGet());
        }
        filmes.removeIf(f -> f.getId().equals(filme.getId()));
        filmes.add(filme);
        return filme;
    }
}
