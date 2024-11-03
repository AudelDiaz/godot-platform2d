extends VBoxContainer

var name_value = ""
var time_value = ""
var level_key_value = ""
@onready var name_value_label: Label = $NameContainer/NameValue
@onready var time_value_label: Label = $TimeContainer/TimeValue


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	name_value_label.text = str(name_value)
	time_value_label.text = str(time_value)


func _on_button_pressed() -> void:
	if LevelManager._levels[level_key_value].is_unlocked:
		get_tree().change_scene_to_file(LevelManager._levels[level_key_value].scene_path)
	else:
		print("Level is locked")
