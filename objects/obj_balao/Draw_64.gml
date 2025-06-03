draw_set_alpha(alpha);

// Calcula a posição na tela em relação à câmera
var screen_x = camera_get_view_x(view_camera[0]) + x;
var screen_y = camera_get_view_y(view_camera[0]) + y;

// Desenha o sprite do balão
draw_sprite_ext(
    spr_balao, // o sprite do balão
    0,         // subimagem
    screen_x,  // posição X
    screen_y,  // posição Y
    0.4, 0.4,      // escala X e Y
    0,         // rotação
    c_white,   // cor
    alpha      // transparência
);

// Restaura a opacidade total para o que vier depois
draw_set_alpha(1);
