// current address
var _address_len = string_length(obj_level.cur_address);
for (var i=1; i<_address_len; i++) {
	var _value = real(string_char_at(obj_level.cur_address,i+1));
	draw_sprite(spr_symbols, _value, address_x + i*18, 10);
}

// Hint grid
draw_sprite(spr_symbols2, 0, hint_grid_x + 4, hint_grid_y + 4);
draw_sprite(spr_symbols2, 1, hint_grid_x + 4, hint_grid_y + 13);
draw_sprite(spr_symbols2, 2, hint_grid_x + 4, hint_grid_y + 22);
draw_sprite(spr_symbols2, 3, hint_grid_x + 4, hint_grid_y + 31);

for (var i=0; i<obj_level.hint_height; i++) {
	for (var j=0; j<obj_level.hint_width; j++) {
		draw_sprite(
			spr_symbols2,
			obj_level.hint_grid[# j, i] ? 4 : 5,
			j*16 + hint_grid_x + 16,
			i*9 + hint_grid_y + 4
		);
	}
}

if (fade_alpha > 0) {
	draw_set_color(c_white);
	draw_set_alpha(fade_alpha);
	draw_rectangle(0, 0, room_width, room_height, false);
	draw_set_alpha(1);
}

if (show_win_message) {
	draw_sprite(spr_winner, 0, room_width / 2, room_height / 2);
}