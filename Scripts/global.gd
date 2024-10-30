extends Node


const TOTAL_COINS:int = 11

var _player_score = 0
var _player_deaths = 0
var _level_start_time = null
var _level_end_time = null
var _time_score = null

var _global_score = {}

func _ready() -> void:
	load_game()

func increase_score():
	_player_score += 1

func reset_score():
	_player_score = 0
	
func get_score():
	return _player_score
	
func increase_deads():
	_player_deaths += 1
	
func get_deaths():
	return _player_deaths
	
func set_start_time(time):
	_level_start_time = time
	print(_level_start_time)
	
func get_time_score():
	return _time_score
	
func level_finished(level_number: int):
	_level_end_time = Time.get_datetime_dict_from_system()
	_time_score = Time.get_time_string_from_unix_time(Time.get_unix_time_from_datetime_dict(_level_end_time)-Time.get_unix_time_from_datetime_dict(_level_start_time))
	_global_score["Level {level}".format({"level": level_number})] = { "coins": _player_score, "deads": _player_deaths, "time": _time_score}
	save_data()
	
func save_data():
	var save_file = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var json_string = JSON.stringify(_global_score)
	save_file.store_line(json_string)

func load_game():
	if not FileAccess.file_exists("user://savegame.save"):
		return # Error! We don't have a save to load.
	var save_file = FileAccess.open("user://savegame.save", FileAccess.READ)
	_global_score = JSON.parse_string(save_file.get_as_text())
	print(_global_score)
