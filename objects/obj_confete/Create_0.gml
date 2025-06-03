part_sys = part_system_create();

// Paleta de cores fortes
cores = [
    c_red,
    c_green,
    c_blue,
    c_yellow,
    c_fuchsia,
    c_orange,
    c_aqua,
    make_color_rgb(128, 0, 128)
];

// Criar um único tipo de partícula que usaremos várias vezes
part_confete = part_type_create();
part_type_shape(part_confete, pt_shape_star);
part_type_size(part_confete, 0.4, 0.6, 0, 0);
part_type_speed(part_confete, 3, 6, 0, 0);
part_type_direction(part_confete, 0, 360, 0, 20);
part_type_gravity(part_confete, 0.15, 270);
part_type_life(part_confete, 40, 70);

// Emitir várias partículas com cores diferentes
var quantidade = 50;
for (var i = 0; i < quantidade; i++) {
    var cor_aleatoria = cores[irandom(array_length(cores) - 1)];
    part_type_color1(part_confete, cor_aleatoria); // Define a cor antes de criar
    part_particles_create(part_sys, x, y, part_confete, 1);
}

// Timer para destruir o sistema de partículas
alarm[0] = game_get_speed(gamespeed_fps) * 3.0; // Aumentei para 3 segundos para dar tempo das partículas aparecerem