// Inicialização das variáveis padrão
alpha = 0;
alpha_speed = 0.05;
fade_in_completo = false;

resposta_na_esquerda = global.resposta_na_esquerda;

with (obj_sacola) {
    instance_destroy();
}

// Até 3 sprites diferentes com seus valores
// Inicializa arrays para sprites e valores (devem ser definidos pelos objetos filhos)
// O primeiro elemento sempre deve ser preenchido, os outros são opcionais
sprites_item = array_create(3, noone);  // Array com 3 posições, todas começando como noone
valores_unitarios = array_create(3, 0);  // Array com 3 posições, todas começando como 0
qtd_sprites_usados = 0;  // Quantos sprites diferentes estão sendo usados nesta fase

// Obtém as dimensões da room para centralização
largura_room = room_width;
centro_x = largura_room / 2;
espaco_entre_botoes = 500; // Espaço entre os 

instance_create_layer(0, 0, "UI", obj_escurecimento);

mostrar_interface = true; // Mostra os sprites e valores apenas no início

// Toca o som da tela
alarm[0] = 5; // 0.08s a 60fps