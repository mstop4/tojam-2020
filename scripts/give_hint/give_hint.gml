//@arg room_index
var _room_map = argument[0];

if (!ds_exists(_room_map, ds_type_map)) return;
if (!_room_map[? "hasHint"]) return;

_room_map[? "gaveHint"] = true;
_room_map[? "theHint"] = hint_list[| hint_index];
hint_index++;

if (hint_index >= ds_list_size(hint_list)) {
	hint_index = 0;
}

var _hint_x = real(string_char_at(_room_map[? "theHint"], 1)) - 1;
var _hint_y = real(string_char_at(_room_map[? "theHint"], 2)) - 1;

hint_grid[# _hint_x, _hint_y] = true;

// Update hint guy if it is in the same room as the revealed hint
if (hint_guy.room_index == _room_map) {
		hint_guy.gave_hint = true;
		hint_guy.display = _room_map[? "theHint"];
}