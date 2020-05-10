//@arg node_list
//@arg solution_address

var _node_list = ds_list_create();
ds_list_copy(_node_list, argument[0]);
ds_list_shuffle(_node_list);
var _solution_address = argument[1];

var _num_hints = max((string_length(_solution_address)-1) * (MAX_CHILDREN-1), floor(ds_list_size(_node_list) * HINT_RATIO));
show_debug_message(string(_num_hints) + "/" + string(ds_list_size(_node_list)));

for (var i=0; i<_num_hints; i++) {
	var _cur_node = _node_list[| i];
	_cur_node[? "hasHint"] = true;
}

ds_list_destroy(_node_list);

hint_width = string_length(solution_address) - 1;
hint_height = MAX_CHILDREN;
hint_grid = ds_grid_create(hint_width, hint_height);
ds_grid_set_region(hint_grid, 0, 0, hint_width-1, hint_height-1, false);

hint_list = ds_list_create();
hint_index = 0;
for (var i=1; i<=hint_width; i++) {
	var _right_answer = real(string_char_at(solution_address, i+1));
	for (var j=1; j<=hint_height; j++) {
		if (j != _right_answer) {
			ds_list_add(hint_list, string(i) + string(j));
		}
	}
}

ds_list_shuffle(hint_list);