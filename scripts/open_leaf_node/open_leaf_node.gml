//@arg value
var _value = argument[0];

var _guess = obj_level.cur_address + string(_value);
show_debug_message(_guess);

if (_guess == obj_level.solution_address) {
	obj_gui.show_win_message = true;
	return true;
}

return false;
