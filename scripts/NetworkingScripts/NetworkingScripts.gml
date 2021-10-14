#macro ID 0

#macro KEYS 10
#macro MSG 11

function sendKeypress(_key, _press){
	var buff = buffer_create(128, buffer_grow, 1);
	buffer_seek(buff, buffer_seek_start, 0);
	
	buffer_write(buff, buffer_u8, KEYS);
	buffer_write(buff, buffer_u16, _key);
	buffer_write(buff, buffer_u8, _press);
	
	network_send_packet(client, buff, buffer_tell(buff));
	show_debug_message("client sending data");
	buffer_delete(buff);
}

function sendData(_data, _macro, _type){
	var buff = buffer_create(128, buffer_grow, 1);
	buffer_seek(buff, buffer_seek_start, 0);
	
	buffer_write(buff, buffer_u8, _macro);
	buffer_write(buff, _type, _data);
	
	if(object_get_name(object_index) == "obj_server")
		network_send_packet(server, buff, buffer_tell(buff));
	else
		network_send_packet(client, buff, buffer_tell(buff));
	buffer_delete(buff);
}

function ServerRecieveData(){

	var _player;
	for(var i = 0; i < ds_list_size(clientlist); i++){
		if(clientlist[| i].playerId == async_load[? "id"]){
			_player = i; //find player id because if _player = clientlist[i] it will copy and not change actual value
			break;
		}
	}
	/*
	client doesn't trigger connect event
		--> can't send generated id to server on connect
	*/
	show_debug_message(_player);
	var _buff = buffer_create(128, buffer_grow, 1);
	buffer_copy(async_load[? "buffer"], 0, buffer_get_size(async_load[? "buffer"]), _buff, 0);
	
	var _cmd = buffer_read(_buff, buffer_u8);
	
	switch(_cmd){
		case KEYS:
			var _key = buffer_read(_buff, buffer_u16);
			var _pressed = buffer_read(_buff, buffer_u8);
			switch(_key){
				case vk_up:
					if(_pressed != 0) clientlist[| _player].up_pressed = true;
					else clientlist[| _player].up_pressed = false;
				break;
				case vk_down:
					if(_pressed != 0) clientlist[| _player].down_pressed = true;
					else clientlist[| _player].down_pressed = false;
				break;
				case vk_right:
					if(_pressed != 0) clientlist[| _player].right_pressed = true;
					else clientlist[| _player].right_pressed = false;
				break;
				case vk_left:
					if(_pressed != 0) clientlist[| _player].left_pressed = true;
					else clientlist[| _player].left_pressed = false;
				break;
			}
			msg += "player " + string(clientlist[| _player][$ "playerId"]) + "position changed to "
					+ string(clientlist[| _player].x) + "/" + string(clientlist[| _player].y) + "\n";
		break;
		
		case MSG:
		break;
	}
	
	buffer_delete(_buff);
}