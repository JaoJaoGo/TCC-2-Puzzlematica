fogos_criados = false;

// Define o tempo para o alarme
alarm[0] = 60 * 7;

// Mensagem do final da fase
tempo_espera = 7.5; // 0.125 segundo(s) (em frames)
escala = 0.2;       // começa bem pequeno
escala_chegou = 1.5;
alvo_escala = 1;
alpha = 1;
estado = "chegando"; // pode ser: "chegando", "esperando".

// Toca um áudio de parabenização aleatoriamente
var audio_index = irandom(array_length(global.sfx_parabenizacao) - 1);
audio_play_sound(global.sfx_parabenizacao[audio_index], 10, false);
