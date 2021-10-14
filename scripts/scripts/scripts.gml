// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function Player(_id) constructor{
	playerId = _id;
	x = 200;
	y = 200;
	
	left_pressed = false;
	right_pressed = false;
	up_pressed = false;
	down_pressed=  false;
	
	spd = 3;
	
	static step = function(){
		var hdir = right_pressed - left_pressed;
		var vdir = down_pressed - up_pressed;
		
		x += hdir * spd;
		y += vdir * spd;
	}
	
	static draw = function(){
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_circle(x,y,5,false);
	}
}