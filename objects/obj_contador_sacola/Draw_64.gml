draw_set_alpha(alpha);

var screen_x = camera_get_view_x(view_camera[0]) + x;
var screen_y = camera_get_view_y(view_camera[0]) + y;

// Desenha o texto + número
draw_set_font(comic_neue_large);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(cor_texto);

if (texto == "Você consegue!" || texto == "Você quase acertou! Tente novamente.") {
    // Desenha o texto padrão (ex: "Muito bem!") com escala normal
	var offset_y = 30;
    draw_text_transformed(screen_x, screen_y - offset_y, texto, 0.4, 0.4, 0);
} else {
	// Desenha o texto padrão (ex: "Muito bem!") com escala normal
	var offset_y = 25;
    draw_text_transformed(screen_x, screen_y - offset_y, texto, 1, 1, 0);
}

draw_set_alpha(1);
