package com.example.CineAnalise.controller;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.example.CineAnalise.model.Analise;
import com.example.CineAnalise.model.Filme;
import com.example.CineAnalise.repository.AnaliseRepository;
import com.example.CineAnalise.repository.FilmeRepository;

@RestController
@RequestMapping("/api/filmes")
public class FilmeController {

    @Autowired
    private FilmeRepository filmeRepository;

    @Autowired
    private AnaliseRepository analiseRepository;

    @GetMapping
    public List<Filme> listarFilmes() {
        return filmeRepository.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Filme> obterFilme(@PathVariable Long id) {
        Optional<Filme> filmeOpt = filmeRepository.findById(id);
        if (filmeOpt.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        Filme filme = filmeOpt.get();
        filme.setAnalises(analiseRepository.findByFilme_Id(id));
        return ResponseEntity.ok(filme);
    }

    @PostMapping
    public ResponseEntity<Filme> criarFilme(@RequestBody Filme filme) {
        Filme salvo = filmeRepository.save(filme);
        return ResponseEntity.ok(salvo);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Filme> atualizarFilme(@PathVariable Long id, @RequestBody Filme filme) {
        return filmeRepository.findById(id)
                .map(existing -> {
                    existing.setTitulo(filme.getTitulo());
                    existing.setSinopse(filme.getSinopse());
                    existing.setGenero(filme.getGenero());
                    existing.setAno(filme.getAno());
                    Filme atualizado = filmeRepository.save(existing);
                    return ResponseEntity.ok(atualizado);
                })
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletarFilme(@PathVariable Long id) {
        if (!filmeRepository.existsById(id)) {
            return ResponseEntity.notFound().build();
        }
        filmeRepository.deleteById(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/{filmeId}/analises")
    public ResponseEntity<List<Analise>> listarAnalises(@PathVariable Long filmeId) {
        if (!filmeRepository.existsById(filmeId)) {
            return ResponseEntity.notFound().build();
        }
        List<Analise> analises = analiseRepository.findByFilme_Id(filmeId);
        return ResponseEntity.ok(analises);
    }

    @PostMapping("/{filmeId}/analises")
    public ResponseEntity<Analise> adicionarAnalise(@PathVariable Long filmeId, @RequestBody Analise analise) {
        Optional<Filme> filmeOpt = filmeRepository.findById(filmeId);
        if (filmeOpt.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        analise.setFilme(filmeOpt.get());
        Analise salvo = analiseRepository.save(analise);
        return ResponseEntity.ok(salvo);
    }

    @PutMapping("/analies/{id}")
    public ResponseEntity<Analise> atualizarAnalise(@PathVariable Long id, @RequestBody Analise analise) {
        return analiseRepository.findById(id)
                .map(existing -> {
                    existing.setTexto(analise.getTexto());
                    existing.setNota(analise.getNota());
                    Analise atualizado = analiseRepository.save(existing);
                    return ResponseEntity.ok(atualizado);
                })
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/analies/{id}")
    public ResponseEntity<Void> deletarAnalise(@PathVariable Long id) {
        if (!analiseRepository.existsById(id)) {
            return ResponseEntity.notFound().build();
        }
        analiseRepository.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
