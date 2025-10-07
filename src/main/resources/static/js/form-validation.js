

(function() {
    'use strict';
    
    class FormValidator {
        constructor() {
            this.init();
        }
        
        init() {
            this.setupFilmeFormValidation();
            this.setupCharacterCounter();
        }
        
        setupFilmeFormValidation() {
            const form = document.querySelector('form[action*="/filmes"]');
            
            if (!form) return;
            
            form.addEventListener('submit', (e) => {
                if (!this.validateFilmeForm()) {
                    e.preventDefault();
                }
            });
        }
        
        validateFilmeForm() {
            const anoInput = document.getElementById('ano');
            
            if (!anoInput) return true;
            
            const ano = parseInt(anoInput.value);
            const anoAtual = new Date().getFullYear();
            
            if (isNaN(ano) || ano < 1900 || ano > anoAtual + 5) {
                this.showAlert(
                    `Por favor, insira um ano válido entre 1900 e ${anoAtual + 5}`,
                    'error'
                );
                anoInput.focus();
                return false;
            }
            
            return true;
        }
        
        setupCharacterCounter() {
            const textareas = document.querySelectorAll('textarea[maxlength]');
            
            textareas.forEach(textarea => {
                const maxLength = parseInt(textarea.getAttribute('maxlength'));
                
                const counter = document.createElement('div');
                counter.className = 'char-counter';
                textarea.parentNode.appendChild(counter);
                
                const updateCounter = () => {
                    const remaining = maxLength - textarea.value.length;
                    counter.textContent = `${remaining} caracteres restantes`;
                    
                    if (remaining < 100) {
                        counter.classList.add('warning');
                    } else {
                        counter.classList.remove('warning');
                    }
                    
                    if (document.body.classList.contains('dark')) {
                        counter.classList.add('dark');
                    }
                };
                
                textarea.addEventListener('input', updateCounter);
                
                updateCounter();
            });
        }
        
        showAlert(message, type = 'info') {
            alert(message); 
        }
    }
    
    class FormUtils {
        static setupDeleteConfirmations() {
            const deleteForms = document.querySelectorAll('form[action*="/deletar"]');
            
            deleteForms.forEach(form => {
                form.addEventListener('submit', (e) => {
                    const isFilme = form.action.includes('/filmes/deletar');
                    const message = isFilme
                        ? 'Tem certeza que deseja deletar este filme? Todas as análises serão removidas também.'
                        : 'Tem certeza que deseja deletar esta análise?';
                    
                    if (!confirm(message)) {
                        e.preventDefault();
                    }
                });
            });
        }
        
        static setupAutoResize() {
            const textareas = document.querySelectorAll('textarea');
            
            textareas.forEach(textarea => {
                textarea.style.resize = 'vertical';
                textarea.style.minHeight = '100px';
            });
        }
        
        static setupYearInput() {
            const yearInput = document.getElementById('ano');
            
            if (!yearInput) return;
            
            yearInput.addEventListener('input', (e) => {
                e.target.value = e.target.value.replace(/[^0-9]/g, '');
                
                if (e.target.value.length > 4) {
                    e.target.value = e.target.value.slice(0, 4);
                }
            });
        }
        
        static setupFieldFeedback() {
            const inputs = document.querySelectorAll('input[required], textarea[required], select[required]');
            
            inputs.forEach(input => {
                input.addEventListener('blur', () => {
                    if (input.value.trim() === '') {
                        input.style.borderColor = '#C00000';
                    } else {
                        input.style.borderColor = '';
                    }
                });
                
                input.addEventListener('input', () => {
                    if (input.value.trim() !== '') {
                        input.style.borderColor = '';
                    }
                });
            });
        }
    }
    
    function init() {
        new FormValidator();
        FormUtils.setupDeleteConfirmations();
        FormUtils.setupAutoResize();
        FormUtils.setupYearInput();
        FormUtils.setupFieldFeedback();
    }
    
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
    
})();
