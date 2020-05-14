var _test = json_encode(tree);
var _test_path = get_save_filename("", "test.json");
var _file = file_text_open_write(_test_path);
file_text_write_string(_file, _test);
file_text_close(_file);