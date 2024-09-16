extends Node2D


@onready var jump_sound: AudioStreamPlayer2D = $JumpSound
@onready var coyote_timer: Timer = $CoyoteTimer

@export var coyote_time_duration:float = 0.15 

const JUMP_VELOCITY = -260.

var player:CharacterBody2D = null
var was_on_floor:bool = false
var is_enable_to_jump:bool = false


func _ready() -> void:
	player = get_parent()
	coyote_timer.one_shot = true
	coyote_timer.timeout.connect(_on_coyote_timer_timeout)
	
func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("jump") and (player.is_on_floor() or is_enable_to_jump):
		player.velocity.y = JUMP_VELOCITY
		jump_sound.play()
		
	if was_on_floor and not player.is_on_floor() and player.get_real_velocity().y >= 0:
		is_enable_to_jump = true
		coyote_timer.start(coyote_time_duration)
		
	was_on_floor = player.is_on_floor()


func _on_coyote_timer_timeout() -> void:
	is_enable_to_jump = false
