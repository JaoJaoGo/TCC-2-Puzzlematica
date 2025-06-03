// Criar fogos de artifício apenas uma vez
if (!fogos_criados) {
	instance_create_layer(0, 0, "Effects", obj_fogos_artificio);
    fogos_criados = true;
}

switch (estado) {
    case "chegando":
        escala = lerp(escala, escala_chegou, 0.15);
        if (abs(escala - escala_chegou) < 0.01) {
            escala = escala_chegou;
            estado = "esperando";
        }
        break;

    case "esperando":
        tempo_espera -= 1;
        if (tempo_espera <= 0) {
            estado = "diminui";
        }
        break;

    case "diminui":
        escala = lerp(escala, alvo_escala, 0.1);
        break;
}
