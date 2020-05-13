draw_self();

if (state == DOOR_TYPE.DOOR) {
	draw_sprite(door_symbol_list[value-1],image_index,x,y);
} else if (state == DOOR_TYPE.MAILBOX) {
	draw_sprite(mailbox_symbol_list[value-1],image_index,x,y);
}