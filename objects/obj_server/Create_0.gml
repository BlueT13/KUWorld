/// @description Insert description here
// You can write your code in this editor
var port = 6510;

globalvar server;
server = network_create_server(network_socket_tcp, port, 4);

if(server < 0) show_debug_message("failed to create server!");

clientlist = ds_list_create();

msg = "";