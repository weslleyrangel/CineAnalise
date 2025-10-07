<script>
    // Dark Mode Toggle
    const toggleButton = document.getElementById('theme-toggle');
    const html = document.documentElement;

    // Carrega preferência salva
    if (localStorage.getItem('theme') === 'dark' || (!localStorage.getItem('theme') && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
        html.classList.add('dark');
        document.body.classList.add('dark');
        toggleButton.textContent = 'Light Mode';
        toggleButton.classList.add('dark');
    } else {
        html.classList.remove('dark');
        document.body.classList.remove('dark');
        toggleButton.textContent = 'Dark Mode';
    }

    // Evento de toggle
    toggleButton.addEventListener('click', () => {
        if (html.classList.contains('dark')) {
            html.classList.remove('dark');
            document.body.classList.remove('dark');
            toggleButton.textContent = 'Dark Mode';
            localStorage.setItem('theme', 'light');
        } else {
            html.classList.add('dark');
            document.body.classList.add('dark');
            toggleButton.textContent = 'Light Mode';
            localStorage.setItem('theme', 'dark');
        }
        // Atualiza classes dark em elementos dinâmicos se necessário
        document.querySelectorAll('.window, .button, .input, .textarea, .select').forEach(el => {
            el.classList.toggle('dark');
        });
    });

    // Listener para mudança de preferência do sistema
    window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', e => {
        if (!localStorage.getItem('theme')) {
            if (e.matches) {
                html.classList.add('dark');
                document.body.classList.add('dark');
                toggleButton.textContent = 'Light Mode';
            } else {
                html.classList.remove('dark');
                document.body.classList.remove('dark');
                toggleButton.textContent = 'Dark Mode';
            }
        }
    });
</script>
