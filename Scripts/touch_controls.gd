extends CanvasLayer

@onready var left_button: TouchScreenButton = $LeftButton
@onready var right_button: TouchScreenButton = $RightButton
@onready var jump_button: TouchScreenButton = $JumpButton


func _ready() -> void:
	visible = true

func _on_left_button_pressed() -> void:
	left_button.modulate.a = 0.5


func _on_left_button_released() -> void:
	left_button.modulate.a = 1.0


func _on_right_button_pressed() -> void:
	right_button.modulate.a = 0.5


func _on_right_button_released() -> void:
	right_button.modulate.a = 1.0

func _on_jump_button_pressed() -> void:
	jump_button.modulate.a = 0.5


func _on_jump_button_released() -> void:
	jump_button.modulate.a = 1.0
