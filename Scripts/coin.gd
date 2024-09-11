extends Area2D

const TOTAL_COINS: int = 11
@onready var end_score: Label = %EndScore
@onready var audio_stream_player: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _on_body_entered(_body: Node2D) -> void:
	Global.increase_score()
	audio_stream_player.play()
	animated_sprite.visible = false
	collision_shape.call_deferred("set", "disabled", true)
	if Global.get_score() < TOTAL_COINS:
		end_score.text = "Recolecta todas las monedas \n" + str(Global.get_score()) + " de " + str(TOTAL_COINS) + "."
	else:
		end_score.text = "Felicitaciones!! \nhas recolectado \ntodas las monedas."
	


func _on_audio_stream_player_2d_finished() -> void:
	queue_free()
