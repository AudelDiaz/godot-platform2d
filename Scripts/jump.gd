extends Node2D


@onready var jump_sound: AudioStreamPlayer2D = $JumpSound
@onready var coyote_timer: Timer = $CoyoteTimer
@onready var buffer_timer: Timer = $BufferTimer

@export var coyote_time_duration:float = 0.15 
@export var buffer_time_duration:float = 0.25

const JUMP_VELOCITY = -260.

var player:CharacterBody2D = null
var was_on_floor:bool = false
var is_enable_to_jump:bool = false
var is_jump_buffered:bool = false


func _ready() -> void:
	player = get_parent()
	coyote_timer.one_shot = true
	buffer_timer.one_shot = true
	coyote_timer.timeout.connect(_on_coyote_timer_timeout)
	buffer_timer.timeout.connect(_on_buffer_timer_timeout)
	
func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("jump"): 
		if player.is_on_floor() or is_enable_to_jump:
			jump()
		else:
			is_jump_buffered = true
			buffer_timer.start(buffer_time_duration)
		
	if was_on_floor and not player.is_on_floor() and player.get_real_velocity().y >= 0:
		is_enable_to_jump = true
		coyote_timer.start(coyote_time_duration)
	
	if not was_on_floor and player.is_on_floor() and is_jump_buffered:
		is_jump_buffered = false
		buffer_timer.stop()
		print("buffered jump")
		jump()
		
	was_on_floor = player.is_on_floor()
	
	
func jump() -> void:
	player.velocity.y = JUMP_VELOCITY
	jump_sound.play()


func _on_coyote_timer_timeout() -> void:
	is_enable_to_jump = false
	
	
func _on_buffer_timer_timeout() -> void:
	is_jump_buffered = false
