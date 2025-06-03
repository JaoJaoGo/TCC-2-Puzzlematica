// Se o audio anterior ainda estiver tocando, interrompa
if (audio_is_playing(global.id_audio_valores)) {
	audio_stop_sound(global.id_audio_valores);
}

global.id_audio_escolha = audio_play_sound(sfx_fase_3_escolha, 1, false);