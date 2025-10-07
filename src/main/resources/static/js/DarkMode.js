(function() {
    'use strict';
    
    function initDarkMode() {
        const toggleButton = document.getElementById('theme-toggle');
        const html = document.documentElement;
        const body = document.body;
        
        if (!toggleButton) {
            console.warn('Botão de toggle do tema não encontrado');
            return;
        }
        
        let isDark = false;
        try {
            const savedTheme = localStorage.getItem('theme');
            if (savedTheme) {
                isDark = savedTheme === 'dark';
            } else {
                isDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
            }
        } catch (e) {
            console.warn('localStorage não disponível, usando preferência do sistema');
            isDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
        }
        
        applyTheme(isDark);
        
        toggleButton.addEventListener('click', function() {
            isDark = !isDark;
            applyTheme(isDark);
            
            try {
                localStorage.setItem('theme', isDark ? 'dark' : 'light');
            } catch (e) {
                console.warn('Não foi possível salvar preferência de tema');
            }
        });
        
        try {
            window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', function(e) {
                try {
                    if (!localStorage.getItem('theme')) {
                        isDark = e.matches;
                        applyTheme(isDark);
                    }
                } catch (err) {
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