/// @description Insert description here
// You can write your code in this editor

var _list = "[";
for(var i = 0; i < ds_list_size(clientlist); i++){
	_list += string(clientlist[| i].playerId) + ", ";
	clientlist[| i].draw();
}
_list += "]";


draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_text(25, 25, _list);
draw_text(25, room_height - 25, msg);