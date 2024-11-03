extends Control

func _ready() -> void:
	MusicBackground.pitch_scale = 1
	
func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Config/level_select.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
