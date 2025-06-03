global.total_itens = 0;

arrastando = false;
animando_saida = false;
velocidade_rotacao = 0;

escala_normal = 1;
escala_arrastando = 1.2;

image_alpha = 1;
image_xscale = escala_normal;
image_yscale = escala_normal;

global.id_audio_motivacao = noone;

function get_delay_by_room() {
    var delay_objeto = noone;
    
    // Mapear cada room para seu delay correspondente
    switch (room) {
        case room_fase_3_1:
            delay_objeto = obj_delay_fase_3_1;
            break;
        case room_fase_3_2:
            delay_objeto = obj_delay_fase_3_2;
            break;
        case room_fase_3_3:
            delay_objeto = obj_delay_fase_3_3;
            break;
    }
    
    return delay_objeto;
}