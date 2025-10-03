package com.example.CineAnalise.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.CineAnalise.model.Analise;
import com.example.CineAnalise.model.Filme;
import com.example.CineAnalise.repository.AnaliseRepository;
import com.example.CineAnalise.repository.FilmeRepository;

@Controller
@RequestMapping("/filmes")
public class FilmeController {

    @Autowired
    private FilmeRepository filmeRepository;

    @Autowired
    private AnaliseRepository analiseRepository;

    @GetMapping
    public String listarFilmes(Model model) {
        model.addAttribute("filmes", filmeRepository.findAll());
        return "listar-filmes";
    }

    @GetMapping("/novo")
    public String mostrarFormularioCadastro(Model model) {
        model.addAttribute("filme", new Filme());
        return "form-filmes";
    }

    @PostMapping
    public String cadastrarFilme(@ModelAttribute Filme filme) {
        filmeRepository.save(filme);
        return "redirect:/filmes";
    }

    @GetMapping("/{id}")
    public String verDetalhes(@PathVariable Long id, Model model) {
        return filmeRepository.findById(id)
                .map(filme -> {
                    model.addAttribute("filme", filme);
                    model.addAttribute("analises", analiseRepository.findByFilmeId(id));
                    model.addAttribute("novaAnalise", new Analise());
                    return "detalhes-filme";
                })
                .orElse("redirect:/filmes");
    }

    @PostMapping("/{filmeId}/analises")
    public String adicionarAnalise(@PathVariable Long filmeId, @ModelAttribute Analise novaAnalise) {
        novaAnalise.setFilmeId(filmeId);
        analiseRepository.save(novaAnalise);
        return "redirect:/filmes/" + filmeId;
    }
}
