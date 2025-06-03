// Limpar todos os recursos
part_type_destroy(part_rastro);
part_type_destroy(part_explosao);
part_type_destroy(part_brilho);

// Destruir todos os emissores
for (var i = 0; i < fogos_ativos; i++) {
    if (emissores[i] != undefined) {
        part_emitter_destroy(part_sys, emissores[i].emitter);
    }
}

// Destruir o sistema de partículas
part_system_destroy(part_sys);