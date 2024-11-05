extends Control

var _next_level = ""

func _ready() -> void:
	MusicBackground.pitch_scale = 1
	for level_key in LevelManager._levels.keys():
		var level = LevelManager._levels[level_key]
		if level.is_unlocked:
			ResourceLoader.exists(level.scene_path)
			_next_level = level_key
		else:
			break
	
func _on_play_pressed() -> void:
	LevelManager.load_level(_next_level)

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_level_select_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Config/level_select.tscn")
