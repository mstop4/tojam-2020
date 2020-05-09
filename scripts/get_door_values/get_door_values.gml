var _room = argument[0];

var _values = [];

if (ds_map_exists(_room, "children")) {
	var _children = _room[? "children"];
	var _len = ds_list_size(_children);
	
	for (var i=0; i<_len; i++) {
		var _child = _children[| i];
		_values[i] = _child[? "value"];
	}
}

return _values;