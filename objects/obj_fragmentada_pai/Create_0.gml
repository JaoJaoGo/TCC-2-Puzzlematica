// Define se está sendo arrastado
arrastando = false;

// Define posição alvo (local de encaixe)
alvo_x = x;
alvo_y = y;

// Define se a peça já foi encaixada corretamente
encaixada = false;

// Tamanho original da sprite
depth = -100;
escala_normal = 1.75;
escala_arrastando = 1.9;

// Aplica o tamanho inicial
image_xscale = escala_normal;
image_yscale = escala_normal;

alarm[0] = -1; // Valor padrão (não usado inicialmente)

global.id_audio_motivacao = noone;