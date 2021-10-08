#macro CMD 1
#macro EMOTE 2

//...add more macros as needed

function netAddData(_type, _datatype, _data){
	//_type = CMD, EMOTE, ...
	//_datatype = buffer_u8, buffer_u16, buffer_string
	//_data = appropriate data of _type
	//example: netAddData(EMOTE, buffer_u8, 1) -> adds no.1 emote to packet
	
	buffer_write(global.clientBuffer, buffer_u8, _type);
	buffer_write(global.clientBuffer, _type, _data);
}

function netSendData(_type, _data){
	network_send_packet(global.client, global.clientBuffer, buffer_get_size(global.clientBuffer));	
	buffer_delete(global.clientBuffer);
	global.clientBuffer = buffer_create(128, buffer_grow, 1)
}

function updateData(){
	
}