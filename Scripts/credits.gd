extends Control
@onready var menu_button: Button = $MenuButton

func _ready() -> void:
	menu_button.grab_focus()

func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/UI/main_menu.tscn")
