extends Node


const TOTAL_COINS:int = 11

var _player_score = 0
var _player_deads = 0

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
	_player_deads += 1
	
func level_finished(level_number: int):
	_global_score["Level {level}".format({"level": level_number})] = { "coins": _player_score, "deads": _player_deads}
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
