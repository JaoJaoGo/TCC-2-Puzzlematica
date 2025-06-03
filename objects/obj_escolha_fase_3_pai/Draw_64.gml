if (mostrar_interface) {
	// Aplica transparência
	draw_set_alpha(alpha);

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_set_font(comic_neue);

	// Título
	draw_text_transformed(display_get_gui_width()/2, 75, "Itens na sacola", 2, 2, 0);

	// Exibição visual dos itens e valores
	var gui_width = display_get_gui_width();
	var gui_height = display_get_gui_height();
	var center_x = gui_width / 2;

	// Definições de layout
	var item_scale = 2; // Escala do sprite do item
	var nota_scale = 1; // Escala do sprite da nota
	var item_y = 260;           // Posição Y dos itens
	var valor_y = item_y + 180;  // Posição Y das cédulas
	var grupo_spacing = 450;    // Espaço entre grupos de itens diferentes

	// Verifica se temos pelo menos um sprite definido
	if (qtd_sprites_usados > 0) {
	    // Calcula a largura total para centralizar
	    var total_width = (qtd_sprites_usados * grupo_spacing) - grupo_spacing; 
	    var start_x = center_x - (total_width / 2);
    
	    // Para cada tipo de sprite
	    for (var tipo = 0; tipo < qtd_sprites_usados; tipo++) {
	        // Se o sprite for válido
	        if (sprites_item[tipo] != noone) {
	            var current_x = start_x + (tipo * grupo_spacing);
            
	            // Desenha o item
	            draw_sprite_ext(sprites_item[tipo], 0, current_x, item_y, item_scale, item_scale, 0, c_white, alpha);
            
	            // Seleciona a cédula apropriada com base no valor unitário deste item
	            var valor_unitario = valores_unitarios[tipo];
	            var sprite_cedula = spr_nota_10_fase_3; // Sprite padrão
            
	            if (valor_unitario <= 2) {
	                sprite_cedula = spr_nota_2_fase_3;
	            } else if (valor_unitario <= 5) {
	                sprite_cedula = spr_nota_5_fase_3;
	            } else if (valor_unitario <= 10) {
	                sprite_cedula = spr_nota_10_fase_3;
	            } else if (valor_unitario <= 20) {
	                sprite_cedula = spr_nota_20_fase_3;
	            } else if (valor_unitario <= 50) {
	                sprite_cedula = spr_nota_50_fase_3;
	            } else if (valor_unitario <= 100) {
	                sprite_cedula = spr_nota_100_fase_3;
	            }
            
	            // Desenha a cédula
	            draw_sprite_ext(sprite_cedula, 0, current_x, valor_y, nota_scale, nota_scale, 0, c_white, alpha);
            
	            // Desenha o símbolo "+" se não for o último item
	            if (tipo < qtd_sprites_usados - 1) {
					var plus_x = current_x + (grupo_spacing / 2);
	                draw_text_transformed(plus_x, item_y, "+", 2.0, 2.0, 0); // Escala 2x para o símbolo +
	            }
	        }
	    }
	}

	// Restaura alpha para não afetar outros elementos de desenho
	draw_set_alpha(1);	
}