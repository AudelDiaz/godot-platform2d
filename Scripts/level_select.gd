extends Control

@onready var grid_container: HBoxContainer = $ScrollContainer/GridContainer
@onready var level_element_scene = preload("res://Scenes/Config/level_element.tscn")
@onready var button: Button = $Button

func _ready() -> void:
	for level_key in LevelManager._levels:
		var level = LevelManager._levels[level_key]
		var spawned_element = level_element_scene.instantiate()
		spawned_element.name_value = level.name
		spawned_element.time_value = level.best_time
		print(level.best_time)
		spawned_element.level_key_value = level_key
		grid_container.add_child(spawned_element)
		if level.is_unlocked == false:
			spawned_element.button.disabled = true
		button.grab_focus()


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/UI/main_menu.tscn")
