(function() {
    'use strict';

    /**
     * Função para salvar um cookie.
     * @param {string} name - O nome do cookie.
     * @param {string} value - O valor do cookie.
     * @param {number} days - A quantidade de dias para o cookie expirar.
     */
    function setCookie(name, value, days) {
        let expires = "";
        if (days) {
            const date = new Date();
            date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
            expires = "; expires=" + date.toUTCString();
        }
        document.cookie = name + "=" + (value || "") + expires + "; path=/";
    }

    /**
     * Função para ler o valor de um cookie específico.
     * @param {string} name - O nome do cookie a ser lido.
     * @returns {string|null} - O valor do cookie ou null se não for encontrado.
     */
    function getCookie(name) {
        const nameEQ = name + "=";
        const ca = document.cookie.split(';');
        for(let i = 0; i < ca.length; i++) {
            let c = ca[i];
            while (c.charAt(0) === ' ') c = c.substring(1, c.length);
            if (c.indexOf(nameEQ) === 0) return c.substring(nameEQ.length, c.length);
        }
        return null;
    }
    
    function initDarkMode() {
        const toggleButton = document.getElementById('theme-toggle');
        const html = document.documentElement;
        const body = document.body;
        
        if (!toggleButton) {
            console.warn('Botão de toggle do tema não encontrado');
            return;
        }
        
        let isDark = false;
        const savedTheme = getCookie('theme'); 
        if (savedTheme) {
            isDark = savedTheme === 'dark';
        } else {
            isDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
        }
        
        applyTheme(isDark);
        
        toggleButton.addEventListener('click', function() {
            isDark = !isDark;
            applyTheme(isDark);
            setCookie('theme', isDark ? 'dark' : 'light', 365); 
        });
        
        try {
            window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', function(e) {
                if (!getCookie('theme')) {
                    isDark = e.matches;
                    applyTheme(isDark);
                }
            });
        } catch (e) {
            console.warn('Não foi possível adicionar listener de preferência do sistema');
        }
        
        function applyTheme(dark) {
            if (dark) {
                html.classList.add('dark');
                body.classList.add('dark');
                toggleButton.textContent = 'Light Mode';
                toggleButton.classList.add('dark');
            } else {
                html.classList.remove('dark');
                body.classList.remove('dark');
                toggleButton.textContent = 'Dark Mode';
                toggleButton.classList.remove('dark');
            }
            
            updateElementClasses(dark);
        }
        
        function updateElementClasses(dark) {
            const elements = document.querySelectorAll('.window, .button, .input, .textarea, .select, .title-bar, .label');
            elements.forEach(function(el) {
                if (dark) {
                    el.classList.add('dark');
                } else {
                    el.classList.remove('dark');
                }
            });
        }
    }
    
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initDarkMode);
    } else {
        initDarkMode();
    }
})();