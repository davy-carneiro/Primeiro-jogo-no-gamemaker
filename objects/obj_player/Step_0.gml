#region CONTROLES

key_right = keyboard_check(ord("D")); //DIREITA
key_left = keyboard_check(ord("A")); //ESQUERDA
key_jump = keyboard_check(vk_space); //JUMP

#endregion

#region MOVIMENTAÇÃO

var move = key_right - key_left; //Se o usuário pressionar as duas teclas o movimento será nulo

hspd = move * spd; //Se o usuário presionar só uma, ele vai multiplicar vezes a velocidade: 1 * spd ou -1 * spd

vspd = vspd + grv;

//Se a movimentação nao for nula, ou seja, 
//o usuário escolheu um lado para ir, então 
//este objeto deve se virar para o lado 
//selecionado. o sign é uma função que 
//indica se um número é nulo, positivo ou
//negativo. Exemplo: 100 (retorna 1), -2
//(retorna -1), 0 retorna (0).
if (hspd != 0) image_xscale = sign(hspd); 


//COLISÃO HORIZONTAL

if place_meeting(x+hspd,y,obj_chao){ //se ele colidir
	while(!place_meeting(x+sign(hspd),y,obj_chao)) {
		x = x + sign(hspd);	
	}
	hspd = 0; //zera a movimentação até ele parar de colidir
}
x = x + hspd;

//COLISÃO VERTICAL

if place_meeting(x,y+vspd,obj_chao){ //se ele colidir
	while(!place_meeting(x,y+sign(vspd),obj_chao)) {
		y = y + sign(vspd);	
	}
	vspd = 0; //zera a movimentação até ele parar de colidir
}
y = y + vspd;

//JUMP

if place_meeting(x,y+1,obj_chao) and key_jump {
	vspd -= 8;
}

#endregion
