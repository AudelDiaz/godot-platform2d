extends CanvasLayer

@onready var v_box_container: VBoxContainer = $VBoxContainer
@onready var texture_rect: TextureRect = $TextureRect
@onready var resume: Button = $VBoxContainer/Resume
@onready var full_screen: Button = $Control/FullScreen


func _ready() -> void:
	if OS.get_name() not in ["iOS", "Android"]:
		print(OS.get_name())
	texture_rect.visible = false
	v_box_container.visible = false
	full_screen.visible = false
	visible = true
	
	
	
func set_paused():
	get_tree().paused = not get_tree().paused
	texture_rect.visible = not texture_rect.visible
	v_box_container.visible = not v_box_container.visible
	full_screen.visible = not full_screen.visible
	resume.grab_focus()

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		set_paused()


func _on_resume_pressed() -> void:
	set_paused()


func _on_main_menu_pressed() -> void:
	set_paused()
	get_tree().change_scene_to_file("res://Scenes/UI/main_menu.tscn")


func _on_level_select_pressed() -> void:
	set_paused()
	get_tree().change_scene_to_file("res://Scenes/Config/level_select.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_full_screen_pressed() -> void:
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
