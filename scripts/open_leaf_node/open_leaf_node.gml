//@arg value
var _value = argument[0];

var _guess = cur_address + string(_value);
show_debug_message(_guess);

if (_guess == solution_address) {
	show_message_async("You win");
}
