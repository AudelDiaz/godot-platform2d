extends CanvasLayer

@onready var jump_button: TouchScreenButton = $Control2/JumpButton


func _ready() -> void:
	visible = true


func _on_jump_button_pressed() -> void:
	jump_button.modulate.a = 0.5

func _on_jump_button_released() -> void:
	jump_button.modulate.a = 1.0
