extends Control
@onready var finish: Label = $VBoxContainer/Finish


func _ready() -> void:
	finish.text = "CONGRATULATIONS, YOU HAVE COLLECTED {score} COINS!\nWANT TO PLAY AGAIN?".format({"score": Global.get_score() if Global.get_score() != Global.TOTAL_COINS else "ALL"})
	

func _on_yes_button_pressed() -> void:
	Global.reset_score()
	get_tree().change_scene_to_file("res://Scenes/level_01.tscn")


func _on_no_button_pressed() -> void:
	get_tree().quit()
