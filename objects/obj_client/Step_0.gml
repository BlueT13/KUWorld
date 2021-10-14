/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(vk_up)){
	sendKeypress(vk_up, true);
} else if(keyboard_check_released(vk_up)){
	sendKeypress(vk_up, false);
}
if(keyboard_check_pressed(vk_down)){
	sendKeypress(vk_down, true);
} else if(keyboard_check_released(vk_down)){
	sendKeypress(vk_down, false);
}
if(keyboard_check_pressed(vk_left)){
	sendKeypress(vk_left, true);
} else if(keyboard_check_released(vk_left)){
	sendKeypress(vk_left, false);
}
if(keyboard_check_pressed(vk_right)){
	sendKeypress(vk_right, true);
} else if(keyboard_check_released(vk_right)){
	sendKeypress(vk_right, false);
}