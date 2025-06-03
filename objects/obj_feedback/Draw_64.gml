draw_set_alpha(alpha);

var screen_x = camera_get_view_x(view_camera[0]) + x;
var screen_y = camera_get_view_y(view_camera[0]) + y;

// Desenha o texto + número
draw_set_font(comic_neue);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(cor_texto);

if (texto != "") {
    // Desenha o texto padrão (ex: "Muito bem!") com escala normal
	var escala_x = 2.3; // alarga horizontalmente
	var escala_y = 2.6; // estica verticalmente

	var offset_y = 25;
    draw_text_transformed(screen_x, screen_y - offset_y, texto, escala_x, escala_y, 0);
} else {
    // Desenha o número com escala maior e mais abaixo
    draw_text_transformed(screen_x, screen_y, string(numero), escala, escala, 0);
}

draw_set_alpha(1);
