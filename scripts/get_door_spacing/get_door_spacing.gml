//@arg num_doors
//@arg door_width
//@arg spacing

var _num_doors = argument[0];
var _door_width = argument[1];
var _spacing = argument[2];

var _total_width = (_num_doors * _door_width) + ((_num_doors-1) * _spacing);
var _left = (room_width - _total_width + _door_width) / 2;
var _x_pos = [];

for (var i=0; i<_num_doors; i++) {
	_x_pos[i] = _left + i * (_door_width + _spacing);
}

return _x_pos;
