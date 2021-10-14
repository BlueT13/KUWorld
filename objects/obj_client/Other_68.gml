/// @description Insert description here
// You can write your code in this editor

var _id = async_load[? "id"]

if(_id == client){
	var _type = async_load[? "type"];
	if(_type == network_type_data){
		show_debug_message("--------data recieved by client--------");
		var buff = buffer_create(128, buffer_grow, 1);
		buffer_copy(async_load[? "buffer"], 0, buffer_get_size(async_load[? "buffer"]), buff, 0);
		msg += buffer_read(buff, buffer_string);
		buffer_delete(buff);
	}
}