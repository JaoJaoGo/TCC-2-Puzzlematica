// Espera o texto terminar de aparecer antes de iniciar seu próprio fade
if (!iniciou_fade) {
    // Verifica se o texto terminou seu fade in
    if (instance_exists(obj_escolha_fase_3_pai)) {
        if (obj_escolha_fase_3_pai.fade_in_completo) {
            iniciou_fade = true;  // Começa o fade in das opções
        }
    }
    
    // Não processa mais nada enquanto espera
    exit;
}

// Atualiza o fade in das opções
if (alpha < alpha_max) {
    alpha += alpha_speed;
    alpha = min(alpha, alpha_max);
}

// Desativa interações até fade estar quase completo
if (alpha < 0.7) {
    exit; // Não processa o restante do código até estar visível o suficiente
}

// Cálculo de tamanho dinâmico
var espacamento_base = 210;
var margem_extra = 120; 
var altura_base = usar_3_soma ? 500 : 320;
var largura_base = 280;

// Escalas aplicadas para as cédulas
var escala_cedula = 0.75;

// Calculando alturas e larguras dos sprites
var altura1 = 0;
var altura2 = 0;
var altura3 = 0;
var largura1 = 0;
var largura2 = 0;
var largura3 = 0;

if (sprite1 != noone) {
    altura1 = sprite_get_height(sprite1) * escala_cedula;
    largura1 = sprite_get_width(sprite1) * escala_cedula;
}
if (sprite2 != noone) {
    altura2 = sprite_get_height(sprite2) * escala_cedula;
    largura2 = sprite_get_width(sprite2) * escala_cedula;
}
if (sprite3 != noone) {
    altura3 = sprite_get_height(sprite3) * escala_cedula;
    largura3 = sprite_get_width(sprite3) * escala_cedula;
}

// Calculando altura mínima necessária
var altura_minima_conteudo = 0;
if (!usar_soma && !usar_3_soma) {
    altura_minima_conteudo = altura1;
} else if (usar_soma) {
    altura_minima_conteudo = altura1 + altura2 + 60;
} else if (usar_3_soma) {
    altura_minima_conteudo = altura1 + altura2 + altura3 + 120;
}

// Calculando tamanho total do botão
var altura = max(altura_base, altura_minima_conteudo + margem_extra);
var max_largura = max(largura1, largura2, largura3, largura_base);
var largura = max_largura + 40;

// Ajusta a máscara de colisão para corresponder ao tamanho visual
if (sprite_exists(sprite_index)) {
    image_xscale = largura / sprite_width;
    image_yscale = altura / sprite_height;
}

// Verificação de mouse hover
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Verifica se mouse está sobre o botão usando as novas dimensões calculadas
var hover = point_in_rectangle(mx, my, x - largura/2, y - altura/2, x + largura/2, y + altura/2);

// Define escala alvo com base no hover
if (estado_visual == "correto") {
    escala_alvo_hover = escala_destacado; // trava no tamanho com hover
}
else if (estado_visual == "errado") {
    escala_alvo_hover = escala_normal * 0.9; // menor se errado
	draw_set_color(c_white);
}
else {
    escala_alvo_hover = hover ? escala_destacado : escala_normal;
}

// Suaviza o zoom
escala_hover = lerp(escala_hover, escala_alvo_hover, 0.1);

// Clique
if (clicavel && mouse_check_button_pressed(mb_left) && hover) {
    if (eh_correta) {
        estado_visual = "correto";
        clicavel = false;
		
        // Marca o outro botão como errado e desativa
        with (obj_opcoes_fase_3) {
            if (id != other.id) {
                estado_visual = "errado";
                clicavel = false;
            }
        }
		
        instance_create_layer(x, y, "Effects", obj_confete);
        audio_play_sound(sfx_resposta_correta, 1, false);
        alarm[0] = game_get_speed(gamespeed_fps) * 2;
    } else {        
        // Se clicou na errada, todos viram errados e desativam
        with (obj_opcoes_fase_3) {
            estado_visual = "errado";
            clicavel = false;
        }
        with (obj_contador_sacola) instance_destroy();
        var centro_x = display_get_gui_width() / 2;
        var n1 = instance_create_layer(centro_x, 90, "UI", obj_contador_sacola);
        n1.texto = "Você quase acertou! Tente novamente.";
        n1.cor_texto = c_white;
        
        // Seta um delay
        alarm[1] = game_get_speed(gamespeed_fps) * 4;
    }
}