extends Control

@onready var grid_container: GridContainer = $ScrollContainer/GridContainer
@onready var level_element_scene = preload("res://Scenes/Config/level_element.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for level_key in LevelManager._levels:
		var level = LevelManager._levels[level_key]
		print(level.name)
		print(level.best_time)
		print(level_key)
		var spawned_element = level_element_scene.instantiate()
		spawned_element.name_value = level.name
		spawned_element.time_value = str(level.best_time)
		spawned_element.level_key_value = level_key
		grid_container.add_child(spawned_element)
		
