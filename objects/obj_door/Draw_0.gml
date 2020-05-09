draw_set_colour(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

draw_rectangle(x, y, x+64, y+64, true);
draw_text(x+32, y+32, string(value));