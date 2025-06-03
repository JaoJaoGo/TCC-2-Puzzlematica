global.notas_colocadas = 0;
global.nota_sendo_arrastado = noone;
global.total_notas = 0;

var centro_x = display_get_gui_width() / 2;
			
// Número
instance_create_layer(1000, 600, "UI", obj_valor_total);

// Toca o som do tutorial
alarm[0] = 5; // 0.08s a 60fps