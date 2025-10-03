package com.example.CineAnalise.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;

@Entity
@Table(name = "analises")
public class Analise {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "filme_id", nullable = false)
    @JsonBackReference
    private Filme filme;

    @Column(length = 2000, nullable = false)
    private String texto;

    @Column(nullable = false)
    private Integer nota;

    public Analise() {
    }

    public Analise(String texto, Integer nota) {
        this.texto = texto;
        this.nota = nota;
    }

    public Analise(Filme filme, String texto, Integer nota) {
        this.filme = filme;
        this.texto = texto;
        this.nota = nota;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Filme getFilme() {
        return filme;
    }

    public void setFilme(Filme filme) {
        this.filme = filme;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public Integer getNota() {
        return nota;
    }

    public void setNota(Integer nota) {
        if (nota < 1 || nota > 5) {
            throw new IllegalArgumentException("Nota deve estar entre 1 e 5");
        }
        this.nota = nota;
    }

    @Override
    public String toString() {
        return "Analise{" + "id=" + id + ", filme=" + filme + ", texto=" + texto + ", nota=" + nota + '}';
    }

}
