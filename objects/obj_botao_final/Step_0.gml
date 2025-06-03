var spr_w = sprite_get_width(spr_botao_iniciar);
var spr_h = sprite_get_height(spr_botao_iniciar);
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Verifica se mouse está sobre o botão
var sobre_botao = point_in_rectangle(mx, my, btn_x - spr_w/2, btn_y - spr_h/2, btn_x + spr_w/2, btn_y + spr_h/2);

// Aplica efeito de hover (zoom suave)
var alvo_escala = sobre_botao ? 1.5 : 1.0;
escala_botao = lerp(escala_botao, alvo_escala, 0.1);

// Usa dimensões escaladas para clique
var largura = spr_w * escala_botao;
var altura = spr_h * escala_botao;

if(mouse_check_button_pressed(mb_left)) {
	if (point_in_rectangle(mx, my, btn_x - largura/2, btn_y - altura/2, btn_x + largura/2, btn_y + altura/2)) {
		room_goto(global.proxima_fase);
	}
}