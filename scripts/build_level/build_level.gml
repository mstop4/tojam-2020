var _tree = ds_map_create();

var _node_stack = ds_stack_create();
var _depth_stack = ds_stack_create();
var _value_bag = ds_list_create();

// Create root node
_tree[? "id"] = _tree;
_tree[? "value"] = 0;
_tree[? "hasHint"] = false;
_tree[? "hintStatus"] = HINT_STATUS.NOT_GIVEN;
_tree[? "theHint"] = "";
_tree[? "parent"] = -1;
var _root_list = ds_list_create();
ds_map_add_list(_tree, "children", _root_list);
ds_stack_push(_node_stack, _tree);
ds_stack_push(_depth_stack, 1);

// Build tree
while (!ds_stack_empty(_node_stack)) {
	var _cur_node = ds_stack_pop(_node_stack);
	var _cur_depth = ds_stack_pop(_depth_stack);
	
	var _num_level_nodes = _cur_depth == 1 ? MAX_CHILDREN : irandom_range(MIN_CHILDREN, MAX_CHILDREN);
	
	// Fill and shuffle value bag
	ds_list_clear(_value_bag);
	for (var i=MAX_CHILDREN-1; i>=0; i--) {
		_value_bag[| i] = i+1;
	}
	ds_list_shuffle(_value_bag);

	// Create child nodes
	for (var i=_num_level_nodes-1; i>=0; i--) {
		var _new_node = ds_map_create();
		_new_node[? "id"] = _new_node;
		_new_node[? "value"] = _value_bag[| 0];
		_new_node[? "hasHint"] = false;
		_new_node[? "hintStatus"] = HINT_STATUS.NOT_GIVEN;
		_new_node[? "theHint"] = "";
		_new_node[? "parent"] = _cur_node;
		ds_list_delete(_value_bag, 0);
		
		if (_cur_depth+1 <= MAX_DEPTH) {
			var _children_list = ds_list_create();
			ds_map_add_list(_new_node, "children", _children_list);
			ds_stack_push(_node_stack, _new_node);
			ds_stack_push(_depth_stack, _cur_depth+1);
			ds_list_add(node_list, _new_node);
		}
		
		var _cur_node_children = _cur_node[? "children"];
		_cur_node_children[| i] = _new_node;
		ds_list_mark_as_map(_cur_node_children, i);
	}
}

ds_stack_destroy(_node_stack);
ds_stack_destroy(_depth_stack);
ds_list_destroy(_value_bag);

return _tree;