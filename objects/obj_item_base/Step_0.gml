// No início do Event Step
if (animando_saida) {
    // Animação de saída (giro + redução + fade out)
    image_angle += velocidade_rotacao;
    image_xscale = lerp(image_xscale, 0, 0.15);
    image_yscale = lerp(image_yscale, 0, 0.15);
    image_alpha = lerp(image_alpha, 0, 0.1);
    
    // Verifica se já está quase invisível para destruir
    if (image_alpha <= 0.1) {
        instance_destroy();
    }
    
    // Sai do evento para não processar o resto do código
    exit;
}

// Resto do código para quando não está animando saída...
if (image_alpha < 1) {
    image_alpha = 1;
}

// Animação de hover (enquanto arrasta)
if (!animando_saida) {
    var alvo_escala = arrastando ? escala_arrastando : escala_normal;
    image_xscale = lerp(image_xscale, alvo_escala, 0.2);
    image_yscale = lerp(image_yscale, alvo_escala, 0.2);
}

// Início do arrasto
if (mouse_check_button_pressed(mb_left) 
    && position_meeting(mouse_x, mouse_y, id) 
    && global.item_sendo_arrastado == noone) {

    arrastando = true;
    global.item_sendo_arrastado = id;
    depth = -100;
}

// Soltou o botão do mouse
if (mouse_check_button_released(mb_left)) {
    if (arrastando) {
        arrastando = false;

        if (global.item_sendo_arrastado == id) {
            global.item_sendo_arrastado = noone;
        }

        // Verifica se está dentro da sacola
        // No obj_item_base, quando um item é colocado na sacola
		if (place_meeting(x, y, obj_sacola)) {
		    animando_saida = true;
		    velocidade_rotacao = choose(5, -5);
		    global.items_colocados += 1;
			global.total_itens += valor;
    
		    // Atualiza contador UI
		    with (obj_contador_sacola) instance_destroy();
			
		    var centro_x = display_get_gui_width() / 2;
			
			// Balão
			var q1 = instance_create_layer(900, 230, "Balao", obj_balao);
			
			// Número
			var n2 = instance_create_layer(900, 210, "UI", obj_contador_sacola);
			n2.texto = "R$ " + string(valor);
			
			// Interrompe o tutorial se ainda estiver tocando
			if (audio_is_playing(global.id_audio_tutorial_3)) {
			    audio_stop_sound(global.id_audio_tutorial_3);
			}
			
			// Interrompe áudio de motivação se estiver tocando
			for (var i = 0; i < array_length(global.motivacoes); i++) {
			    if (audio_is_playing(global.motivacoes[i])) {
			        audio_stop_sound(global.motivacoes[i]);
			    }
			}
			
			var som;

			switch (valor) {
			    case 2: som = sfx_valor_picole; break;
			    case 5: som = sfx_valor_suco; break;
			    case 10: som = sfx_valor_sanduiche; break;
			    default: som = noone; break;
			}

			audio_play_sound(som, 1, false);
    
		    // Inicia o pulo da sacola
		    with (obj_sacola) {
		        pulando = true;
		        velocidade_pulo = -7;  // Força inicial para cima (valor negativo)
		        escala = 1.6;          // Pequeno aumento instantâneo
		        escala_alvo = 1.6;       // Retorna ao normal gradualmente
		    }
    
		    // Verifica fim da fase
		    if (global.items_colocados == global.total_items) {
		        // Criar o delay baseado na room atual
				var delay_objeto = get_delay_by_room();
				instance_create_layer(0, 0, "UI", delay_objeto);
		    }
		} else {
            // Se não estiver na sacola, volta pro depth normal
            depth = 0;
			
			// Se o tutorial estiver tocando, não interrompe e não toca motivação
			if (audio_is_playing(global.id_audio_tutorial_3)) {
			    // Não toca áudio de motivação durante o tutorial
			} 
			// Se algum áudio de valor estiver tocando, não tocar motivação
			else {
			    var valor_tocando = false;
			    for (var i = 0; i < array_length(global.sfx_valor); i++) {
			        if (audio_is_playing(global.sfx_valor[i])) {
			            valor_tocando = true;
			            break;
			        }
			    }
				
				if(!valor_tocando) {
					with (obj_contador_sacola) instance_destroy();
				
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
			
				    var centro_x = display_get_gui_width() / 2;
			
					// Quadrado Branco no balão
					var q1 = instance_create_layer(900, 230, "Balao", obj_balao);
			
					// Mensagem
					var n1 = instance_create_layer(900, 210, "UI", obj_contador_sacola);
					n1.texto = "Você consegue!";
				}
			}
        }
    }
}

// Enquanto arrasta, sigue o mouse
if (arrastando) {
    x = mouse_x;
    y = mouse_y;
}