draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text(0, 128, cur_address);
draw_text(0, 144, solution_address);

for (var i=0; i<hint_height; i++) {
	for (var j=0; j<hint_width; j++) {
		draw_text(j*16, i*16 + 160, hint_grid[# j, i] ? "X" : "-");
	}
}