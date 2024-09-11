extends CanvasLayer


func _ready() -> void:
	$ColorRect.visible = false
	$VBoxContainer.visible = false
	
func set_paused():
	get_tree().paused = not get_tree().paused
	$ColorRect.visible = not $ColorRect.visible
	$VBoxContainer.visible = not $VBoxContainer.visible

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		set_paused()


func _on_resume_pressed() -> void:
	set_paused()


func _on_main_menu_pressed() -> void:
	set_paused()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
