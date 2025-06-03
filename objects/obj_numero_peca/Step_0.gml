switch (estado) {
    case "chegando":
        escala = lerp(escala, alvo_escala, 0.15);
        if (abs(escala - alvo_escala) < 0.01) {
            escala = alvo_escala;
            estado = "esperando";
        }
        break;

    case "esperando":
        tempo_espera -= 1;
        if (tempo_espera <= 0) {
            estado = "saindo";
        }
        break;

    case "saindo":
        escala = lerp(escala, 1, 0.1);
        alpha = lerp(alpha, 0, 0.05);
        vida -= 1;
        if (vida <= 0) {
            instance_destroy();
        }
        break;
}
