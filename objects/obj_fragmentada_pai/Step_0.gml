var alvo_escala = arrastando ? escala_arrastando : escala_normal;
image_xscale = lerp(image_xscale, alvo_escala, 0.2);
image_yscale = lerp(image_yscale, alvo_escala, 0.2);
// Não permitir mexer se já foi encaixada
if (encaixada) exit;
// Se o mouse clicar na peça
if (mouse_check_button_pressed(mb_left) 
    && position_meeting(mouse_x, mouse_y, id) 
    && global.peca_sendo_arrastada == noone) {
    arrastando = true;
    global.peca_sendo_arrastada = id; // registra essa peça como ativa
    depth = -100;
}
// Solta o botão do mouse
if(mouse_check_button_released(mb_left)) {
	if(arrastando)
	{
		arrastando = false;
		
		if (global.peca_sendo_arrastada == id) {
			global.peca_sendo_arrastada = noone;
		}
		
		// Se estiver perto da posição correta, encaixa
		var dist = point_distance(x, y, alvo_x, alvo_y);
		if(dist < 20) { // CASO DE ACERTO
			x = alvo_x;
			y = alvo_y;
			encaixada = true;
			depth = 0;
			
			// Som e contagem
			global.pecas_colocadas += 1;
			
			instance_create_layer(x, y, "Effects", obj_confete);
			
			// Destroi qualquer número anterior antes de criar um novo
			with (obj_numero_peca) {
			    instance_destroy();
			}
			
			var centro_x = display_get_gui_width()/2;
			
			// Mensagem
			var n1 = instance_create_layer(centro_x, 130, "UI", obj_numero_peca);
			n1.texto = "Muito bem!";
			
			// Número
			var n2 = instance_create_layer(centro_x, 200, "UI", obj_numero_peca);
			n2.numero = global.pecas_colocadas;
			
			// Interrompe o tutorial se ainda estiver tocando
			if (audio_is_playing(global.id_audio_tutorial_1)) {
			    audio_stop_sound(global.id_audio_tutorial_1);
			}
			
			// Interrompe áudio de motivação se estiver tocando
			for (var i = 0; i < array_length(global.motivacoes); i++) {
			    if (audio_is_playing(global.motivacoes[i])) {
			        audio_stop_sound(global.motivacoes[i]);
			    }
			}
			
			audio_play_sound(sfx_nota_colocada, 1, false);
			    
			// Reproduz a contagem se estiver no intervalo
			var idx = global.pecas_colocadas;
			if (idx >= 1 && idx <= array_length(global.sfx_contagem)) {
			    audio_play_sound(global.sfx_contagem[idx - 1], 1, false);
			}
			
			// Verifica se terminou a fase
			if(global.pecas_colocadas == global.total_pecas) {
				alarm[0] = 180; // 3 segundos (assumindo 60 FPS fixos)
			}
		} else { // CASO DE ERRO
			// Volta pro depth normal se não encaixou
			depth = 0;
			
			// Se o tutorial estiver tocando, não interrompe e não toca motivação
			if (audio_is_playing(global.id_audio_tutorial_1)) {
			    // Não toca áudio de motivação durante o tutorial
			} 
			// Se algum áudio de contagem estiver tocando, não tocar motivação
			else {
			    var contagem_tocando = false;
			    for (var i = 0; i < array_length(global.sfx_contagem); i++) {
			        if (audio_is_playing(global.sfx_contagem[i])) {
			            contagem_tocando = true;
			            break;
			        }
			    }
			    
			    if (!contagem_tocando) {
					// Destroi qualquer número anterior antes de criar um novo
					with (obj_numero_peca) {
					    instance_destroy();
					}
					
			        // Se não existe o índice de motivação, inicializa
			        if (!variable_global_exists("motivacao_index")) {
			            global.motivacao_index = 0;
			        }
			        
			        // Se o áudio de motivação anterior ainda estiver tocando, não reproduz outro
					if (!audio_is_playing(global.id_audio_motivacao)) {
					    var som = global.motivacoes[global.motivacao_index];
					    global.id_audio_motivacao = audio_play_sound(som, 1, false);
    
					    // Incrementa o índice e faz looping se necessário
					    global.motivacao_index = (global.motivacao_index + 1) % array_length(global.motivacoes);
					}
			        
			        // Incrementa o índice e faz looping se necessário
			        global.motivacao_index = (global.motivacao_index + 1) % array_length(global.motivacoes);
					
					// Mensagem de reforço positivo caso ocorra erro
					var centro_x = display_get_gui_width()/2;
			
					// Mensagem
					var n2 = instance_create_layer(centro_x, 130, "UI", obj_numero_peca);
					n2.texto = "Você consegue!";
			    }
			}
		}
	}
}
// Se estiver arrastando, siga o mouse
if(arrastando) {
	x = mouse_x;
	y = mouse_y;
}