extends Node

@onready var run_timer: Timer = $RunTimer


@export var effect_duration: int = 5
@export var effect_material: Material
var player: CharacterBody2D = null



func _ready() -> void:
	player = get_parent()
	#player.run_effect.connect(_on_player_run_effect)
	run_timer.timeout.connect(_on_timeout)

func _on_player_run_effect() -> void:
	if run_timer.time_left > 0:
		player.run_effect_is_active = true
		player.enable_material(effect_material)
	run_timer.start(effect_duration + run_timer.time_left)

func _on_timeout() -> void:
	player.run_effect_is_active = false
	player.enable_material(null)
