// F11 desativa a tela cheia
if (keyboard_check_pressed(vk_f11)) {
    window_set_fullscreen(!window_get_fullscreen());
}

// Atalhos do Numpad para pular para as fases específicas
if (keyboard_check_pressed(vk_numpad1)) {
    room_goto(room_fase_1_1);
}
if (keyboard_check_pressed(vk_numpad2)) {
    room_goto(room_fase_2_1);
}
if (keyboard_check_pressed(vk_numpad3)) {
    room_goto(room_fase_3_1);
}

if (keyboard_check_pressed(vk_numpad4)) {
    room_goto(room_fase_1_2);
}
if (keyboard_check_pressed(vk_numpad5)) {
    room_goto(room_fase_2_2);
}
if (keyboard_check_pressed(vk_numpad6)) {
    room_goto(room_fase_3_2);
}

if (keyboard_check_pressed(vk_numpad7)) {
    room_goto(room_fase_1_3);
}
if (keyboard_check_pressed(vk_numpad8)) {
    room_goto(room_fase_2_3);
}
if (keyboard_check_pressed(vk_numpad9)) {
    room_goto(room_fase_3_3);
}