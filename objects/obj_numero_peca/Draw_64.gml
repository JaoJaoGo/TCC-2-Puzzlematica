draw_set_alpha(alpha);
draw_set_color(c_white);
draw_set_font(comic_neue_large);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var screen_x = camera_get_view_x(view_camera[0]) + x;
var screen_y = camera_get_view_y(view_camera[0]) + y;

if (texto != "") {
    // Desenha o texto padrão (ex: "Muito bem!") com escala normal
	var offset_y = 25;
    draw_text_transformed(screen_x, screen_y - offset_y, texto, 0.35, 0.35, 0);
} else {
    // Desenha o número com escala maior e mais abaixo
    draw_text_transformed(screen_x, screen_y, string(numero), escala, escala, 0);
}

draw_set_alpha(1);
