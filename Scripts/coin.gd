extends Area2D

@onready var audio_stream_player: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _on_body_entered(_body: Node2D) -> void:
	Global.increase_score()
	audio_stream_player.play()
	collision_shape.call_deferred("set", "disabled", true)
	
	
