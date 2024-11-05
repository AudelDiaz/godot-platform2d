extends Control
@onready var finish: Label = $VBoxContainer/Finish
@onready var coins: Label = $VBoxContainer/HBoxContainer2/VBoxContainer2/coins
@onready var deaths: Label = $VBoxContainer/HBoxContainer2/VBoxContainer/deaths



func _ready() -> void:
	finish.text = "CONGRATULATIONS!\nYOU HAVE FINISHED IN {time_score}!\n\nWANT TO PLAY AGAIN?".format({"time_score": LevelManager.runtime})
	deaths.text = "deahts\nx" + str(Global.get_deaths())
	coins.text = "coins\nx" + str(Global.get_score())

func _on_yes_button_pressed() -> void:
	Global.reset_score()
	get_tree().change_scene_to_file("res://Scenes/Levels/level_01.tscn")


func _on_no_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/UI/main_menu.tscn")
