// Incrementar timer
timer++;

// Criar novos fogos a cada intervalo
if (timer % 20 == 0 && fogos_ativos < max_fogos) {
    // Posição inicial (na parte inferior da tela)
    var ini_x = random_range(room_width * 0.1, room_width * 0.9);
    var ini_y = room_height;
    
    // Posição alvo (já definida no Create)
    var alvo_x = alvos_x[fogos_ativos];
    var alvo_y = alvos_y[fogos_ativos];
    
    // Calcular direção e velocidade
    var dir = point_direction(ini_x, ini_y, alvo_x, alvo_y);
    var spd = point_distance(ini_x, ini_y, alvo_x, alvo_y) / (room_speed * 0.8); // Duração da subida
    
    // Criar um emissor para acompanhar este foguete
    var emissor = part_emitter_create(part_sys);
    part_emitter_region(part_sys, emissor, ini_x, ini_x, ini_y, ini_y, ps_shape_rectangle, ps_distr_linear);
	
    if(fogos_ativos < 1) {
		audio_play_sound(sfx_foguete_1, 1, false);
	}
	
    // Armazenar informações do foguete
    emissores[fogos_ativos] = {
        emitter: emissor,
        x: ini_x,
        y: ini_y,
        target_x: alvo_x,
        target_y: alvo_y,
        direction: dir,
        speed: spd,
        exploded: false,
        color: cores[irandom(array_length(cores) - 1)]
    };
    
    fogos_ativos++;
}

// Atualizar todos os fogos ativos
for (var i = 0; i < fogos_ativos; i++) {
    var foguete = emissores[i];
    
    // Se o foguete já explodiu, pula para o próximo
    if (foguete.exploded) continue;
    
    // Mover o foguete
    foguete.x += lengthdir_x(foguete.speed, foguete.direction);
    foguete.y += lengthdir_y(foguete.speed, foguete.direction);
    
    // Atualizar posição do emissor
    part_emitter_region(part_sys, foguete.emitter, foguete.x, foguete.x, foguete.y, foguete.y, ps_shape_rectangle, ps_distr_linear);
    
    // Criar rastro
    part_emitter_burst(part_sys, foguete.emitter, part_rastro, 1);
    
    // Verificar se chegou ao alvo
    if (point_distance(foguete.x, foguete.y, foguete.target_x, foguete.target_y) < foguete.speed) {
        // Explodir!
        criar_explosao(foguete.x, foguete.y, foguete.color);
        foguete.exploded = true;
    }
}

// Verificar se é hora de destruir o objeto
if (timer >= tempo_total) {
    // Verificar se todos os fogos já explodiram
    var todos_explodiram = true;
    for (var i = 0; i < fogos_ativos; i++) {
        if (!emissores[i].exploded) {
            todos_explodiram = false;
            break;
        }
    }
    
    if (todos_explodiram || timer >= tempo_total * 1.5) {
        instance_destroy();
    }
}