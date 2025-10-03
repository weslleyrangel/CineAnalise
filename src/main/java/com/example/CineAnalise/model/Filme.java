package com.example.CineAnalise.model;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import java.util.ArrayList;
import java.util.List;



@Entity
@Table(name = "filmes")
public class Filme {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(nullable = false)
    private String titulo;
    @Column(length = 2000)
    private String sinopse;
    private String genero;
    private Integer ano;
    @OneToMany(mappedBy = "filme", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonManagedReference
    private List<Analise> analises = new ArrayList<>();
    
    public Filme() {
    }

    public Filme(String titulo, String sinopse, String genero, Integer ano) {
        this.titulo = titulo;
        this.sinopse = sinopse;
        this.genero = genero;
        this.ano = ano;
    }
    
    public void addAnalise(Analise analise){
        analises.add(analise);
        analise.setFilme(this);
    }
    
    public void removeAnalise(Analise analise){
        analises.remove(analise);
        analise.setFilme(null);
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getSinopse() {
        return sinopse;
    }

    public void setSinopse(String sinopse) {
        this.sinopse = sinopse;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public Integer getAno() {
        return ano;
    }

    public void setAno(Integer ano) {
        this.ano = ano;
    }

    public List<Analise> getAnalises() {
        return analises;
    }

    public void setAnalises(List<Analise> analises) {
        this.analises = analises;
    }

    @Override
    public String toString() {
        return "Filme{" + "id=" + id + ", titulo=" + titulo + ", genero=" + genero + ", ano=" + ano + '}';
    }
    
    
}