/// @description Insert description here
// You can write your code in this editor
var _id = async_load[? "id"]
show_debug_message(async_load[? "socket"]);

if(_id == server){
	var _type = async_load[? "type"];
	if(_type == network_type_connect){
		show_debug_message("--------client connected--------")
		
		var player = new Player(async_load[? "socket"]);
		msg += string(player) + "\n";
		ds_list_add(clientlist, player);
		sendData(async_load[? "socket"], ID, buffer_u16);
		//ds_list_add(clientlist, async_load[? "socket"]);
	} else if(_type == network_type_disconnect){
		show_debug_message("--------client disconnected--------")
		
		var player;
		for(var i = 0; i < ds_list_size(clientlist); i++){
			if(clientlist[| i].playerId == async_load[? "socket"]){
				//player = clientlist[| i][$ "playerId"];
				ds_list_delete(clientlist, i);
				break;
			}
		}
		
		//var _pos = ds_list_find_index(clientlist, async_load[? "socket"]);
		//ds_list_delete(clientlist, _pos);
	}
} else if(_id == client){
} else {
	if(async_load[? "type"] == network_type_data){
		show_debug_message("--------data recieved by server--------");
		ServerRecieveData();
		
		#region deprecated
		/*var buff = buffer_create(128, buffer_grow, 1);
		buffer_copy(async_load[? "buffer"], 0, buffer_get_size(async_load[? "buffer"]), buff, 0);
		msg += buffer_read(buff, buffer_string);
		if(ds_list_size(clientlist) > 0){
			for(var i = 0; i < ds_list_size(clientlist); i++){
				network_send_packet(clientlist[| i][$ "playerId"], buff, buffer_tell(buff));
			}
		}
		buffer_delete(buff);*/
		#endregion
	}
}