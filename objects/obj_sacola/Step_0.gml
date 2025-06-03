// Animação de escala (lerp suave)
escala = lerp(escala, escala_alvo, 0.2);
image_xscale = escala;
image_yscale = escala;

// Sistema de pulo e bounce
if (pulando) {
    // Aplicar gravidade à velocidade vertical
    velocidade_pulo += gravidade;
    
    // Atualizar posição Y
    y += velocidade_pulo;
    
    // Verificar se atingiu ou passou do chão
    if (y >= posicao_y_original) {
        y = posicao_y_original; // Reposiciona exatamente no chão
        
        // Se a velocidade ainda for significativa, faz bounce
        if (abs(velocidade_pulo) > 1) {
            velocidade_pulo = -velocidade_pulo * elasticidade; // Inverte e reduz a velocidade
            
            // Efeito de "esmagamento" na escala quando toca o chão
            escala = 1.6;
            escala_alvo = 1.6;
        } else {
            // Se a velocidade for muito baixa, para de pular
			instance_create_layer(x, y, "Effects", obj_confete);
			
			audio_play_sound(sfx_sacola, 1, false);
			
            pulando = false;
            velocidade_pulo = 0;
            y = posicao_y_original;
        }
    }
}