/// @description Insert description here
// You can write your code in this editor


var ip = "127.0.0.1";
var port = 6510;
globalvar client;
client = network_create_socket(network_socket_tcp);
//clientid = current_time + random(1000);

network_connect(client, ip, port);
msg = "";