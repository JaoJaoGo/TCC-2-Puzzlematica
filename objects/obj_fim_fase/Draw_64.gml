// Desenha fundo preto
draw_set_alpha(0.8); // transparência de 80%
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

draw_set_alpha(1); // volta à opacidade normal para o resto do desenho

// Define alinhamento, cor e fonte
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(comic_neue);

// Mensagem de parabéns
draw_sprite_ext(
    spr_parabens,              // sprite
    0,                         // subimagem
    display_get_gui_width()/2, // x (centro da tela)
    300,                       // y
    escala,                    // escala x
    escala,                    // escala y
    0,                         // ângulo de rotação
    c_white,                   // cor
    1                          // alpha
);

