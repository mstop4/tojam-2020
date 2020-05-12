draw_self();

if (!is_parent_door) {
	if (state == 0) {
		draw_sprite(door_symbol_list[value-1],image_index,x,y);
	} else {
		draw_sprite(spr_symbols,value,x,y-16);
	}
}