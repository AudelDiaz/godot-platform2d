extends Node


const TOTAL_COINS:int = 11

var _player_score = 0
var _player_deaths = 0

var _global_score = {}

signal score_updated

func _ready() -> void:
	load_game()

func increase_score():
	_player_score += 1
	score_updated.emit(_player_score)

func reset_score():
	_player_score = 0
	_player_deaths = 0
	LevelManager.runtime = 0.0
	
func get_score():
	return _player_score
	
func increase_deads():
	_player_deaths += 1
	
func get_deaths():
	return _player_deaths
	
func level_finished(_level_number: int):
	LevelManager.complete_level()
	var _level_key = LevelManager.current_level
	_global_score = LevelManager._levels
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
	if len(_global_score.keys()) != len(LevelManager._levels.keys()):
		_global_score.merge(LevelManager._levels, true)
	else:
		_global_score.merge(LevelManager._levels)
	LevelManager._levels = _global_score
	print(_global_score)
