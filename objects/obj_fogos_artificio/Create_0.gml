// Sistema de partículas principal
part_sys = part_system_create();
part_system_depth(part_sys, -1000); // Garantir que fica na frente de tudo

// Cores vibrantes para os fogos
cores = [
    c_red, 
    c_green,
    c_blue,
    c_yellow, 
    c_fuchsia, 
    c_orange,
    make_color_rgb(255, 105, 180), // Pink
    make_color_rgb(148, 0, 211)    // Roxo
];

// Criar tipo de partícula para o rastro
part_rastro = part_type_create();
part_type_shape(part_rastro, pt_shape_smoke);
part_type_size(part_rastro, 0.1, 0.2, -0.01, 0);
part_type_color3(part_rastro, c_white, c_yellow, c_orange);
part_type_alpha3(part_rastro, 0.8, 0.5, 0);
part_type_life(part_rastro, 15, 25);

// Criar tipo de partícula para a explosão
part_explosao = part_type_create();
part_type_shape(part_explosao, pt_shape_spark);
part_type_size(part_explosao, 0.5, 0.8, -0.01, 0);
part_type_speed(part_explosao, 2, 5, -0.1, 0);
part_type_direction(part_explosao, 0, 360, 0, 0);
part_type_orientation(part_explosao, 0, 360, 4, 0, 0);
part_type_life(part_explosao, 30, 60);
part_type_alpha3(part_explosao, 1, 0.8, 0);

// Criar tipo de partícula para os brilhos finais
part_brilho = part_type_create();
part_type_shape(part_brilho, pt_shape_spark);
part_type_size(part_brilho, 0.1, 0.3, -0.01, 0);
part_type_alpha3(part_brilho, 1, 0.6, 0);
part_type_life(part_brilho, 15, 30);

// Criação dos emissores (um para cada foguete)
max_fogos = 15;
fogos_ativos = 0;
emissores = [];

// Temporizador
timer = 0;
tempo_total = room_speed * 10; // 10 segundos de duração do efeito

// Coordenadas alvo para os fogos
alvos_x = [];
alvos_y = [];

// Inicializar alvos
for (var i = 0; i < max_fogos; i++) {
    // Posições aleatórias para os fogos
    alvos_x[i] = random_range(room_width * 0.2, room_width * 0.8);
    alvos_y[i] = random_range(room_height * 0.1, room_height * 0.6);
}

delay_x = 0;
delay_y = 0;

// obj_fogos_artificio - Função criar_explosao (pode ser definida no Create)
function criar_explosao(xx, yy, cor) {
    // Definir cor da explosão
    part_type_color1(part_explosao, cor);
    part_type_color1(part_brilho, cor);
    
    // Escolher tipo de explosão aleatório
    var tipo = irandom(3);
    
    switch (tipo) {
        case 0: // Explosão simples
            part_particles_create(part_sys, xx, yy, part_explosao, irandom_range(30, 50));
			audio_play_sound(sfx_foguete_2, 1, false);
            break;
            
        case 1: // Explosão em círculo
            for (var ang = 0; ang < 360; ang += 20) {
                part_type_direction(part_explosao, ang, ang, 0, 0);
                part_particles_create(part_sys, xx, yy, part_explosao, 1);
            }
            // Resetar direção
            part_type_direction(part_explosao, 0, 360, 0, 0);
			audio_play_sound(sfx_foguete_2, 1, false);
            break;
            
        case 2: // Explosão dupla
            part_particles_create(part_sys, xx, yy, part_explosao, irandom_range(20, 35));
            part_type_color1(part_explosao, cores[irandom(array_length(cores) - 1)]);
            part_particles_create(part_sys, xx, yy, part_explosao, irandom_range(10, 20));
			audio_play_sound(sfx_foguete_2, 1, false);
			audio_play_sound(sfx_foguete_2, 1, false);
            break;
            
        case 3: // Explosão com brilhos
            part_particles_create(part_sys, xx, yy, part_explosao, irandom_range(20, 30));
			audio_play_sound(sfx_foguete_2, 1, false);
			delay_x = xx;
			delay_y = yy;
			alarm[0] = 15;
            break;
    }
}