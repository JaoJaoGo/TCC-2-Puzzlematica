// Essas variáveis serão definidas ao criar a instância
alpha = 0;  // Começa invisível
alpha_speed = 0.05;  // Velocidade do fade in
alpha_max = 1;  // Valor máximo de transparência
iniciou_fade = false;   // Indica se já começou a aparecer
sprite1 = noone;
sprite2 = noone;
sprite3 = noone;
usar_soma = false;
usar_3_soma = false;
eh_correta = false;
escala1 = 0.4;
escala2 = 0.4;
escala3 = 0.4;
escala_hover = 1;           // escala atual
escala_alvo_hover = 1;      // valor para onde a escala deve ir
escala_normal = 1;          // zoom padrão
escala_destacado = 1.15;    // zoom ao passar o mouse
estado_visual = "normal"; // "normal", "correto", "errado"
clicavel = true;

// Toca o som da tela
alarm[2] = 5; // 0.08s a 60fps