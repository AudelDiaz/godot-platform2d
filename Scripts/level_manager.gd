extends Node

var _default_best_time: float = 1000000.0
var current_level = "01"
var runtime: float = 0.0
var is_running: bool = false

var _levels = {
	"01": {
		"name": "Level 01",
		"scene_path": "res://Scenes/Levels/level_01.tscn",
		"best_time": _default_best_time,
		"coins_collected": 0,
		"is_unlocked": true,
		"unlocks": "02"
	},
	"02": {
		"name": "Level 02",
		"scene_path": "res://Scenes/Levels/level_02.tscn",
		"best_time": _default_best_time,
		"coins_collected": 0,
		"is_unlocked": false,
		"unlocks": "03"
	},
	"03": {
		"name": "Level 03",
		"scene_path": "res://Scenes/Levels/level_02.tscn",
		"best_time": _default_best_time,
		"coins_collected": 0,
		"is_unlocked": false,
		"unlocks": "04"
	},
	"04": {
		"name": "Level 04",
		"scene_path": "res://Scenes/Levels/level_02.tscn",
		"best_time": _default_best_time,
		"coins_collected": 0,
		"is_unlocked": false,
		"unlocks": null
	}
}

func load_level(level_key) -> void:
	var scene_path = _levels[level_key].scene_path
	if ResourceLoader.exists(scene_path):
		get_tree().change_scene_to_file(scene_path)
	else:
		print("Level file not found.")
	
	current_level = level_key
	runtime = 0.0
	is_running = true
		
func complete_level() -> void:
	is_running = false
	for level_key in _levels:
		if level_key == _levels[current_level].unlocks:
			_levels[level_key].is_unlocked = true
			print(runtime)
			
		if level_key == current_level:
			if _levels[current_level].best_time > runtime or _levels[current_level].best_time == 0:
				_levels[current_level].best_time = int(runtime)

func _process(delta: float) -> void:
	if is_running:
		runtime += delta
