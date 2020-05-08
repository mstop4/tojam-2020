#macro MIN_CHILDREN 2;
#macro MAX_CHILDREN 4;
#macro MAX_DEPTH 3;
#macro MAX_NODES 64;

num_nodes = 0;

var _node_stack = ds_stack_create();
var _depth_stack = ds_stack_create();
tree = ds_list_create();
ds_stack_push(_node_stack, tree);
ds_stack_push(_depth_stack, 1);

// Build tree
while (!ds_stack_empty(_node_stack)) {
	var _cur_node = ds_stack_pop(_node_stack);
	var _cur_depth = ds_stack_pop(_depth_stack);
	
	if (_cur_depth > MAX_DEPTH) continue;
	
	var _nodes_left = MAX_NODES - num_nodes; 
	var _num_level_nodes = _nodes_left >= MAX_CHILDREN ? irandom_range(MIN_CHILDREN, MAX_CHILDREN) : _nodes_left;
	num_nodes += _num_level_nodes;

	// Create child nodes
	for (var i=_num_level_nodes-1; i>=0; i--) {
		var _new_node = ds_map_create();
		_new_node[? "value"] = i+1;
		var _children_list = ds_list_create();
		ds_map_add_list(_cur_node, "children", _children_list);
		
		_cur_node[| i] = _new_node;
		ds_list_mark_as_map(_cur_node, i);
		ds_stack_push(_node_stack, _new_node);
		ds_stack_push(_depth_stack, _cur_depth+1);
	}
}

ds_stack_destroy(_node_stack);
ds_stack_destroy(_depth_stack);