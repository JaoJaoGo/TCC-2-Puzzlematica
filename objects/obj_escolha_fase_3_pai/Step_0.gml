// Fade in para texto GUI
if (alpha < 1) {
    alpha += alpha_speed;
    if (alpha >= 1) {
        alpha = 1;
        fade_in_completo = true; // Sinaliza que o fade in do texto terminou
    }
}

