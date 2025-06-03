// Vida do número
tempo_espera = 60; // 1 segundo(s) (em frames)
vida = 60;          // duração da animação de saída
escala = 0.2;       // começa bem pequeno
alvo_escala = 2.5;
alpha = 1;
estado = "chegando"; // pode ser: "chegando", "esperando", "saindo
cor_texto = c_black; // padrão (pode ser sobrescrito depois)

texto = ""; // novo campo, vazio por padrão