if (!global.motivacoes_carregadas) {
    global.motivacoes = [
        sfx_motivacao_1,
        sfx_motivacao_2,
        sfx_motivacao_3
    ];
    global.motivacoes_carregadas = true;
}

if (!global.parabenizacoes_carregadas) {
    global.sfx_parabenizacao = [
	    sfx_parabenizacao_1,
	    sfx_parabenizacao_2,
	    sfx_parabenizacao_3,
	    sfx_parabenizacao_4,
	    sfx_parabenizacao_5,
	    sfx_parabenizacao_6,
	    sfx_parabenizacao_7
	];
    global.parabenizacoes_carregadas = true;
}

if (!global.somas_carregadas) {
    global.sfx_soma = [
	    {valor: 2,  som: sfx_soma_2},
	    {valor: 5,  som: sfx_soma_5},
	    {valor: 7,  som: sfx_soma_7},
	    {valor: 10, som: sfx_soma_10},
	    {valor: 12, som: sfx_soma_12},
	    {valor: 15, som: sfx_soma_15},
	    {valor: 20, som: sfx_soma_20},
	    {valor: 22, som: sfx_soma_22},
	    {valor: 30, som: sfx_soma_30},
	    {valor: 32, som: sfx_soma_32}
	];
    global.somas_carregadas = true;
}

if (!global.valores_carregados) {
    global.sfx_valor = [
	    sfx_valor_picole,
		sfx_valor_suco,
		sfx_valor_sanduiche,
	];
    global.valores_carregados = true;
}