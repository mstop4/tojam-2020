//@arg room_map
//@arg hint_index
var _room_map = argument[0];
var _hint_index = argument[1];

with (obj_tree) {
	_room_map[? "hintStatus"] = HINT_STATUS.GIVEN;
	_room_map[? "theHint"] = hint_list[| _hint_index];

	var _hint_x = real(string_char_at(_room_map[? "theHint"], 1)) - 1;
	var _hint_y = real(string_char_at(_room_map[? "theHint"], 2)) - 1;

	hint_grid[# _hint_x, _hint_y] = true;

	// Update hint guy if it is in the same room as the revealed hint
	if (hint_guy.room_index == _room_map) {
			hint_guy.status = HINT_STATUS.GIVEN;
			hint_guy.display = _room_map[? "theHint"];
			hint_guy.image_index = 1;
	}
}