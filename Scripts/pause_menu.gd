extends Control
@onready var color_rect: ColorRect = $CanvasLayer/ColorRect
@onready var v_box_container: VBoxContainer = $CanvasLayer/VBoxContainer


func _ready() -> void:
	color_rect.visible = false
	v_box_container.visible = false
	
func set_paused():
	get_tree().paused = not get_tree().paused
	color_rect.visible = not color_rect.visible
	v_box_container.visible = not v_box_container.visible

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		set_paused()


func _on_resume_pressed() -> void:
	set_paused()


func _on_main_menu_pressed() -> void:
	set_paused()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
