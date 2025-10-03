package com.example.CineAnalise.controller;

import com.example.CineAnalise.model.Analise;
import com.example.CineAnalise.model.Filme;
import com.example.CineAnalise.repository.AnaliseRepository;
import com.example.CineAnalise.repository.FilmeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

/**
 * Controller MVC para as views Thymeleaf Gerencia todas as operações CRUD via
 * interface web
 */
@Controller
@RequestMapping("/filmes")
public class FilmeViewController {

    @Autowired
    private FilmeRepository filmeRepository;

    @Autowired
    private AnaliseRepository analiseRepository;

    @GetMapping
    public String listarFilmes(Model model) {
        List<Filme> filmes = filmeRepository.findAll();
        model.addAttribute("filmes", filmes);
        return "listar-filmes";
    }

    @GetMapping("/novo")
    public String novoFilmeForm(Model model) {
        model.addAttribute("filme", new Filme());
        return "form-filmes";
    }

    @PostMapping
    public String salvarFilme(@ModelAttribute Filme filme, RedirectAttributes redirectAttributes) {
        try {
            Filme filmeSalvo = filmeRepository.save(filme);
            redirectAttributes.addFlashAttribute("mensagem", "Filme cadastrado com sucesso!");
            redirectAttributes.addFlashAttribute("tipo", "sucesso");
            return "redirect:/filmes/" + filmeSalvo.getId();
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("mensagem", "Erro ao cadastrar filme: " + e.getMessage());
            redirectAttributes.addFlashAttribute("tipo", "erro");
            return "redirect:/filmes/novo";
        }
    }

    @GetMapping("/{id}")
    public String detalhesFilme(@PathVariable Long id, Model model, RedirectAttributes redirectAttributes) {
        try {
            Filme filme = filmeRepository.findById(id)
                    .orElseThrow(() -> new RuntimeException("Filme não encontrado"));

            List<Analise> analises = analiseRepository.findByFilme_Id(id);

            model.addAttribute("filme", filme);
            model.addAttribute("analises", analises);
            model.addAttribute("novaAnalise", new Analise());

            return "detalhes-filme";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("mensagem", "Filme não encontrado!");
            redirectAttributes.addFlashAttribute("tipo", "erro");
            return "redirect:/filmes";
        }
    }

    @GetMapping("/editar/{id}")
    public String editarFilmeForm(@PathVariable Long id, Model model, RedirectAttributes redirectAttributes) {
        try {
            Filme filme = filmeRepository.findById(id)
                    .orElseThrow(() -> new RuntimeException("Filme não encontrado"));
            model.addAttribute("filme", filme);
            return "form-filmes";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("mensagem", "Filme não encontrado!");
            redirectAttributes.addFlashAttribute("tipo", "erro");
            return "redirect:/filmes";
        }
    }

    @PostMapping("/editar/{id}")
    public String atualizarFilme(@PathVariable Long id, @ModelAttribute Filme filme, RedirectAttributes redirectAttributes) {
        try {
            Filme filmeExistente = filmeRepository.findById(id)
                    .orElseThrow(() -> new RuntimeException("Filme não encontrado"));

            filmeExistente.setTitulo(filme.getTitulo());
            filmeExistente.setSinopse(filme.getSinopse());
            filmeExistente.setGenero(filme.getGenero());
            filmeExistente.setAno(filme.getAno());

            filmeRepository.save(filmeExistente);

            redirectAttributes.addFlashAttribute("mensagem", "Filme atualizado com sucesso!");
            redirectAttributes.addFlashAttribute("tipo", "sucesso");
            return "redirect:/filmes/" + id;
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("mensagem", "Erro ao atualizar filme: " + e.getMessage());
            redirectAttributes.addFlashAttribute("tipo", "erro");
            return "redirect:/filmes/editar/" + id;
        }
    }

    @PostMapping("/deletar/{id}")
    public String deletarFilme(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            if (!filmeRepository.existsById(id)) {
                throw new RuntimeException("Filme não encontrado");
            }

            filmeRepository.deleteById(id);

            redirectAttributes.addFlashAttribute("mensagem", "Filme deletado com sucesso!");
            redirectAttributes.addFlashAttribute("tipo", "sucesso");
            return "redirect:/filmes";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("mensagem", "Erro ao deletar filme: " + e.getMessage());
            redirectAttributes.addFlashAttribute("tipo", "erro");
            return "redirect:/filmes";
        }
    }

    @PostMapping("/{id}/analises")
    public String adicionarAnalise(@PathVariable Long id, @ModelAttribute Analise analise, RedirectAttributes redirectAttributes) {
        try {
            Filme filme = filmeRepository.findById(id)
                    .orElseThrow(() -> new RuntimeException("Filme não encontrado"));

            if (analise.getNota() == null || analise.getNota() < 1 || analise.getNota() > 5) {
                throw new RuntimeException("Nota deve estar entre 1 e 5");
            }

            analise.setFilme(filme);
            analiseRepository.save(analise);

            redirectAttributes.addFlashAttribute("mensagem", "Análise adicionada com sucesso!");
            redirectAttributes.addFlashAttribute("tipo", "sucesso");
            return "redirect:/filmes/" + id;
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("mensagem", "Erro ao adicionar análise: " + e.getMessage());
            redirectAttributes.addFlashAttribute("tipo", "erro");
            return "redirect:/filmes/" + id;
        }
    }

    @PostMapping("/analises/editar/{id}")
    public String atualizarAnalise(@PathVariable Long id, @ModelAttribute Analise analise, RedirectAttributes redirectAttributes) {
        try {
            Analise analiseExistente = analiseRepository.findById(id)
                    .orElseThrow(() -> new RuntimeException("Análise não encontrada"));

            Long filmeId = analiseExistente.getFilme().getId();

            analiseExistente.setTexto(analise.getTexto());
            analiseExistente.setNota(analise.getNota());

            analiseRepository.save(analiseExistente);

            redirectAttributes.addFlashAttribute("mensagem", "Análise atualizada com sucesso!");
            redirectAttributes.addFlashAttribute("tipo", "sucesso");
            return "redirect:/filmes/" + filmeId;
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("mensagem", "Erro ao atualizar análise: " + e.getMessage());
            redirectAttributes.addFlashAttribute("tipo", "erro");
            return "redirect:/filmes";
        }
    }

    @PostMapping("/analises/deletar/{id}")
    public String deletarAnalise(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            Analise analise = analiseRepository.findById(id)
                    .orElseThrow(() -> new RuntimeException("Análise não encontrada"));

            Long filmeId = analise.getFilme().getId();

            analiseRepository.deleteById(id);

            redirectAttributes.addFlashAttribute("mensagem", "Análise deletada com sucesso!");
            redirectAttributes.addFlashAttribute("tipo", "sucesso");
            return "redirect:/filmes/" + filmeId;
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("mensagem", "Erro ao deletar análise: " + e.getMessage());
            redirectAttributes.addFlashAttribute("tipo", "erro");
            return "redirect:/filmes";
        }
    }
}
