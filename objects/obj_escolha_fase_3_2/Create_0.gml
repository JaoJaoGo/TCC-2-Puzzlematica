// Chama o Create do pai
event_inherited();

// Define quantos sprites diferentes estão sendo usados
qtd_sprites_usados = 2;

// Configura os sprites dos itens e seus valores unitários
sprites_item[0] = spr_item_sanduiche;        // Primeiro item: sanduiche
valores_unitarios[0] = 10;            // Valor do picolé: R$10,00

sprites_item[1] = spr_item_suco;     // Segundo item: Suco
valores_unitarios[1] = 5;           // Valor do sanduíche: R$5,00

// Ajusta o valor total correto baseado nos itens desta fase
global.resposta_correta = valores_unitarios[0] + valores_unitarios[1];

// Cria o botão de avançar
botao_prox = instance_create_layer(largura_room - 120, 700, "UI", obj_botao_prox);
botao_prox.instancia_pai = id;           // A instância que criou o botão
botao_prox.nome_fase = "fase_3_2";       // Apenas para lógica condicional