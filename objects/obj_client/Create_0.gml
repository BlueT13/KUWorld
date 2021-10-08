/// @description Insert description here
// You can write your code in this editor
var type = network_socket_tcp;
var port = 6510;
var url = "127.0.0.1"


global.client = network_create_socket(type);
global.clientBuffer = buffer_create(128, buffer_grow, 1)
network_connect(global.client, url, port);