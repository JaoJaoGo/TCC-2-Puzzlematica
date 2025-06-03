var som;

switch (minifase) {
    case 1: som = sfx_fase_3_tutorial_1; break;
    case 2: som = sfx_fase_3_tutorial_2; break;
    case 3: som = sfx_fase_3_tutorial_3; break;
    default: som = noone; break;
}

global.id_audio_tutorial_3 = audio_play_sound(som, 1, false);