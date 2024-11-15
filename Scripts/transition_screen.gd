extends CanvasLayer

signal on_transition_finished

@onready var color_rect: ColorRect = $ColorRect
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var level_title: Label = $LevelTitle


func _ready() -> void:
	color_rect.visible = false
	level_title.visible = false
	animation_player.animation_finished.connect(_on_animation_finished)
	
	
func _on_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		animation_player.play("fade_to_normal")
		on_transition_finished.emit()
	elif  anim_name == "fade_to_normal":
		color_rect.visible = false
		level_title.visible = false
		

func  transition(level_name: String):
	level_title.text = level_name
	color_rect.visible = true
	level_title.visible = true
	animation_player.play("fade_to_black")
	
	
func load_scene(scene_path: String, title: String = ""):
	if ResourceLoader.exists(scene_path):
			TransitionScreen.transition(title)
			await TransitionScreen.on_transition_finished
			get_tree().change_scene_to_file(scene_path)
	else:
		print("Level file not found.")
