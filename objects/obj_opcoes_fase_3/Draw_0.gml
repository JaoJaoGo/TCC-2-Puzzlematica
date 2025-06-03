// Não desenha nada se nem começou o fade in
if (!iniciou_fade) exit;

// Aplica transparência a todos os elementos
draw_set_alpha(alpha);

// === DESENHA O SPRITE DA MÁQUINA ===
draw_sprite_ext(
    spr_maquina, // o sprite da máquina
    0,         // subimagem
    display_get_gui_width()/2,  // posição X
    290,  // posição Y
    0.70, 0.70,      // escala X e Y
    0,         // rotação
    c_white,   // cor
    alpha      // transparência
);

draw_set_color(c_white);
draw_set_font(comic_neue_large)

var texto = "R$ " + string(global.total_itens);

draw_text_transformed(display_get_gui_width()/2 - 36, 215, texto, 0.58, 0.58, 0);

// ==== CENTRALIZAÇÃO E CONFIGURAÇÃO INICIAL ====
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var pos_x = x;
var pos_y = y;
var espacamento_base = 210; // Espaçamento entre notas na vertical
var margem_extra = 80; // AUMENTADA para garantir área clicável suficiente
var altura_base = usar_3_soma ? 380 : 280; // ALTURA AUMENTADA para mais espaço clicável
var largura_base = 280; // Largura do botão

// Aplica zoom com transição
var escala_zoom = escala_hover;

// Escalas aplicadas para as cédulas
var escala_cedula = 0.75;

// Calculando alturas e larguras dos sprites com escalas aumentadas
var altura1 = 0;
var altura2 = 0;
var altura3 = 0;
var largura1 = 0;
var largura2 = 0;
var largura3 = 0;

if (sprite1 != noone) {
    altura1 = sprite_get_height(sprite1) * escala_cedula * escala_zoom;
    largura1 = sprite_get_width(sprite1) * escala_cedula * escala_zoom;
}

if (sprite2 != noone) {
    altura2 = sprite_get_height(sprite2) * escala_cedula * escala_zoom;
    largura2 = sprite_get_width(sprite2) * escala_cedula * escala_zoom;
}

if (sprite3 != noone) {
    altura3 = sprite_get_height(sprite3) * escala_cedula * escala_zoom;
    largura3 = sprite_get_width(sprite3) * escala_cedula * escala_zoom;
}

// Calculando as alturas mínimas necessárias para as cédulas e sinais
var altura_minima_conteudo = 0;

if (!usar_soma && !usar_3_soma) {
    altura_minima_conteudo = altura1;
} else if (usar_soma) {
    altura_minima_conteudo = altura1 + altura2 + 60; // 60 é um espaço para o sinal "+"
} else if (usar_3_soma) {
    altura_minima_conteudo = altura1 + altura2 + altura3 + 120; // 120 é um espaço para dois sinais "+"
}

// Calculando tamanho total do botão para garantir que inclua TODO o conteúdo
var altura = max(altura_base, altura_minima_conteudo + margem_extra);
// Determina o máximo entre as larguras das cédulas e a largura base, mas não mais que isso para evitar hover excessivo
var max_largura = max(largura1, largura2, largura3, largura_base);
var largura = max_largura + 40; // Adiciona margem lateral fixa

// ==== DESENHA BOTÃO DE FUNDO COM ZOOM ====
switch (estado_visual) {
    case "normal":
        draw_set_color(c_white);
        break;
    case "correto":
        draw_set_color(c_lime);
        break;
    case "errado":
        draw_set_color(make_color_rgb(120, 120, 120));
        escala_zoom *= 0.9; // menor se errado
        break;
}

// Desenha o botão branco de fundos
draw_roundrect(x - largura/2, y - altura/2, x + largura/2, y + altura/2, false);

// Define a cor dos sprites com base no estado
var cor_sprite = c_white;

if (estado_visual == "errado") {
    cor_sprite = make_color_rgb(100, 100, 100); // cinza escuro
}

// ==== DESENHA CONTEÚDO (CEDULAS / TEXTO) COM ZOOM ====
if (!usar_soma && !usar_3_soma) {
    // Caso com 1 sprite
    if (sprite1 != noone) {
        draw_sprite_ext(sprite1, 0, pos_x, pos_y, escala_cedula * escala_zoom, escala_cedula * escala_zoom, 0, cor_sprite, alpha);
    }
} else if (usar_soma) {
    // Caso com 2 sprites - VERTICAL com MAIS ESPAÇO
    var pos_y_nota1 = pos_y - espacamento_base/2;
    var pos_y_mais = pos_y; // Sinal de + no centro exato
    var pos_y_nota2 = pos_y + espacamento_base/2;
    
    // sprite1 (acima)
    draw_sprite_ext(sprite1, 0, pos_x, pos_y_nota1, escala_cedula * escala_zoom, escala_cedula * escala_zoom, 0, cor_sprite, alpha);
    
    // sprite2 (abaixo)
    draw_sprite_ext(sprite2, 0, pos_x, pos_y_nota2, escala_cedula * escala_zoom, escala_cedula * escala_zoom, 0, cor_sprite, alpha);
} else if (usar_3_soma) {
    // Caso com 3 sprites - Totalmente vertical COM MAIS ESPAÇO
    var espacamento_entre_notas = espacamento_base * 0.85;
    
    var pos_y_nota1 = pos_y - espacamento_entre_notas;
    var pos_y_mais = pos_y - espacamento_entre_notas/2; // Posição do primeiro sinal de +
    var pos_y_nota2 = pos_y;
    var pos_y_mais2 = pos_y + espacamento_entre_notas/2; // Segundo sinal de +
    var pos_y_nota3 = pos_y + espacamento_entre_notas;
    
    // sprite1 (topo)
    draw_sprite_ext(sprite1, 0, pos_x, pos_y_nota1, escala_cedula * escala_zoom, escala_cedula * escala_zoom, 0, cor_sprite, alpha);
    
    // sprite2 (meio)
    draw_sprite_ext(sprite2, 0, pos_x, pos_y_nota2, escala_cedula * escala_zoom, escala_cedula * escala_zoom, 0, cor_sprite, alpha);
    
    // sprite3 (inferior)
    draw_sprite_ext(sprite3, 0, pos_x, pos_y_nota3, escala_cedula * escala_zoom, escala_cedula * escala_zoom, 0, cor_sprite, alpha);
}

// Desenhar um contorno dos botões para maior clareza
draw_set_color(c_black);
draw_set_alpha(alpha * 0.7);
draw_roundrect(x - largura/2, y - altura/2, x + largura/2, y + altura/2, true);

// Restaura alpha para evitar problemas em outros desenhos
draw_set_alpha(1);

depth = 0;