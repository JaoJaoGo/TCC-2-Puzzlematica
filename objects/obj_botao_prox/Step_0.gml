// Animação de entrada
if (alpha < 1) alpha += alpha_speed;
var fase_atual = nome_fase;
// Hover
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
hover = point_in_rectangle(mx, my, x - 75, y - 40, x + 75, y + 40); // Ajuste se necessário
escala_alvo = hover ? 1 : 0.7;
escala = lerp(escala, escala_alvo, 0.1);
// Clique
if (mouse_check_button_pressed(mb_left) && hover) {
    if (instance_exists(instancia_pai)) {
        with (instancia_pai) {
            mostrar_interface = false;
			if(fase_atual == "fase_3_1") {
	            // Criação dos botões de resposta nas áreas vermelhas
	            var opcao_esquerda = instance_create_layer(290, 400, "UI", obj_opcoes_fase_3);
	            opcao_esquerda.eh_correta = resposta_na_esquerda;
	            opcao_esquerda.usar_soma = true;
	            opcao_esquerda.sprite1 = spr_nota_10_fase_3;
	            opcao_esquerda.sprite2 = spr_nota_2_fase_3;
;
	            var opcao_direita = instance_create_layer(1090, 400, "UI", obj_opcoes_fase_3);
	            opcao_direita.eh_correta = !resposta_na_esquerda;
	            opcao_direita.usar_soma = true;
	            opcao_direita.sprite1 = spr_nota_5_fase_3;
	            opcao_direita.sprite2 = spr_nota_5_fase_3;
			}
			else if (fase_atual == "fase_3_2") {
				// Criação dos botões de resposta nas áreas vermelhas
	            var opcao_esquerda = instance_create_layer(290, 400, "UI", obj_opcoes_fase_3);
	            opcao_esquerda.eh_correta = resposta_na_esquerda;
	            opcao_esquerda.usar_soma = true;
	            opcao_esquerda.sprite1 = spr_nota_20_fase_3;
	            opcao_esquerda.sprite2 = spr_nota_5_fase_3;

	            var opcao_direita = instance_create_layer(1090, 400, "UI", obj_opcoes_fase_3);
	            opcao_direita.eh_correta = !resposta_na_esquerda;
	            opcao_direita.usar_soma = true;
	            opcao_direita.sprite1 = spr_nota_10_fase_3;
	            opcao_direita.sprite2 = spr_nota_5_fase_3;
			}
			else {
				// Criação dos botões de resposta nas áreas vermelhas
	            var opcao_esquerda = instance_create_layer(290, 400, "UI", obj_opcoes_fase_3);
	            opcao_esquerda.eh_correta = resposta_na_esquerda;
	            opcao_esquerda.usar_3_soma = true;
	            opcao_esquerda.sprite1 = spr_nota_10_fase_3;
	            opcao_esquerda.sprite2 = spr_nota_2_fase_3;
				opcao_esquerda.sprite3 = spr_nota_2_fase_3;

	            var opcao_direita = instance_create_layer(1090, 400, "UI", obj_opcoes_fase_3);
	            opcao_direita.eh_correta = !resposta_na_esquerda;
	            opcao_direita.usar_3_soma = true;
	            opcao_direita.sprite1 = spr_nota_10_fase_3;
	            opcao_direita.sprite2 = spr_nota_5_fase_3;
				opcao_direita.sprite3 = spr_nota_2_fase_3;
			}
        }
    }
    instance_destroy(); // Destrói o botão
}