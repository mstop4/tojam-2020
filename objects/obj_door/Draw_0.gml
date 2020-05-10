draw_self();

if (!is_parent_door) {
	if (image_index == 0) draw_sprite(spr_symbols,value,x,y-48);
	else draw_sprite(spr_symbols,value,x,y-16);
}