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
    && global.nota_sendo_arrastado == noone) {

    arrastando = true;
    global.nota_sendo_arrastado = id;
    depth = -100;
}

// Soltou o botão do mouse
if (mouse_check_button_released(mb_left)) {
    if (arrastando) {
        arrastando = false;

        if (global.nota_sendo_arrastado == id) {
            global.nota_sendo_arrastado = noone;
        }

        // Verifica se está dentro da carteira
        // No obj_nota_pai, quando uma cédula é colocado na carteira
		if (place_meeting(x, y, obj_carteira)) {
		    animando_saida = true;
		    velocidade_rotacao = choose(5, -5);
		    global.notas_colocadas += 1;
			global.total_notas += valor;
    
		    // Atualiza contador UI
		    with (obj_feedback) instance_destroy();
			
			// Interrompe o tutorial se ainda estiver tocando
			if (audio_is_playing(global.id_audio_tutorial_2)) {
			    audio_stop_sound(global.id_audio_tutorial_2);
			}
			
			// Procura o som correspondente ao valor atual
			for (var i = 0; i < array_length(global.sfx_soma); i++) {
			    var entrada = global.sfx_soma[i];

			    if (entrada.valor == global.total_notas) {

			        // Interrompe o som de soma anterior, se estiver tocando
			        if (audio_is_playing(global.som_soma_id)) {
			            audio_stop_sound(global.som_soma_id);
			        }

			        // Toca o novo som e salva o ID
			        global.som_soma_id = audio_play_sound(entrada.som, 1, false);

			        break;
			    }
			}
    
		    // Inicia o pulo da sacola
		    with (obj_carteira) {
		        pulando = true;
		        velocidade_pulo = -7;  // Força inicial para cima (valor negativo)
		        escala = 2.1;          // Pequeno aumento instantâneo
		        escala_alvo = 2;       // Retorna ao normal gradualmente
		    }
    
		    // Verifica fim da fase
		    if (global.notas_colocadas == global.quantidade_notas) {
		        // Criar o delay
				instance_create_layer(0, 0, "UI", obj_delay_fase_2_pai);
		    }
		} else {
            // Se não estiver na sacola, volta pro depth normal
            depth = 0;
			
			with (obj_feedback) instance_destroy();
			
		    var centro_x = display_get_gui_width() / 2;
        }
    }
}

// Enquanto arrasta, sigua o mouse
if (arrastando) {
    x = mouse_x;
    y = mouse_y;
}