// Títulol do jogo
draw_set_alpha(alpha);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(comic_neue_large);
draw_set_color(c_white);
draw_text_transformed(display_get_gui_width()/2, 140, "Campeão das Contas", 0.8, 0.8, 0);

// Texto com troféus
draw_set_font(comic_neue);
var texto = "Você completou todos os desafios. Parabéns!";
var centro_x = display_get_gui_width() / 2;
var pos_y = 240;

// Medidas do texto e dos troféus
var texto_largura = string_width(texto) * 1; // escala x = 1
var trofeu_escala = 0.6;
var trofeu_largura = sprite_get_width(spr_trofeu) * trofeu_escala;

// Posições horizontais
var texto_x = centro_x;
var trofeu_esquerda_x = texto_x - texto_largura/2 - trofeu_largura - 10;
var trofeu_direita_x = texto_x + texto_largura/2 + 50;

// Desenha troféu à esquerda
draw_sprite_ext(spr_trofeu, 0, trofeu_esquerda_x, pos_y, trofeu_escala, trofeu_escala, 0, c_white, alpha);

// Desenha texto
draw_text_transformed(texto_x, pos_y, texto, 1, 1, 0);

// Desenha troféu à direita
draw_sprite_ext(spr_trofeu, 0, trofeu_direita_x, pos_y, trofeu_escala, trofeu_escala, 0, c_white, alpha);

// Botão de próxima fase
var spr = spr_botao_final;
var spr_w = sprite_get_width(spr);
var spr_h = sprite_get_height(spr);
draw_sprite_ext(spr, 0, btn_x, btn_y, escala_botao, escala_botao, 0, c_white, 1);