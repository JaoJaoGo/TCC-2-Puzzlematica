tempo -= 1;
if (tempo <= 0) {
    instance_create_layer(0, 0, "UI", objEscolha);
    instance_destroy(); // remove o delay
}
