// Título do jogo
draw_set_alpha(alpha);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(comic_neue_large);
draw_set_color(c_white);
draw_text_transformed(display_get_gui_width()/2, 140, "Puzzlemática", 1, 1, 0);
draw_set_font(comic_neue);
draw_text_transformed(display_get_gui_width()/2, 220, "Quebra-cabeça, contagem e cálculo", 1, 1, 0);

// Botão de próxima fase
var spr = spr_botao_iniciar;
var spr_w = sprite_get_width(spr);
var spr_h = sprite_get_height(spr);
draw_sprite_ext(spr, 0, btn_x, btn_y, escala_botao, escala_botao, 0, c_white, 1);

draw_text_transformed(display_get_gui_width()/2, 730, "Feito por João Víctor Guedes Carrijo", 0.8, 0.8, 0);