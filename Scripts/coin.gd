extends Area2D

@onready var audio_stream_player: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	if self == %FinalCoin:
		animated_sprite.visible = false
		collision_shape.call_deferred("set", "disabled", true)

func _on_body_entered(_body: Node2D) -> void:
	if self.name == "FinalCoin":
		get_tree().change_scene_to_file("res://Scenes/congratulations.tscn")
	else:
		Global.increase_score()
		if Global.get_score() == Global.TOTAL_COINS:
			%FinalCoin.animated_sprite.visible = true
			%FinalCoin.collision_shape.call_deferred("set", "disabled", false)
		audio_stream_player.play()
		animated_sprite.visible = false
		collision_shape.call_deferred("set", "disabled", true)
	
	
