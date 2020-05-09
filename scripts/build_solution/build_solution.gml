//@arg tree
var _tree = argument[0];

var _cur_node = _tree;
var _solution = "";

while (ds_map_exists(_cur_node, "children")) {
	_solution += string(_cur_node[? "value"]);
	
	var _children = _cur_node[? "children"];
	var _num_children = ds_list_size(_children);
	
	var _choice = irandom_range(0, _num_children-1);
	_cur_node = _children[| _choice];
}

_solution += string(_cur_node[? "value"]);
	
return _solution;