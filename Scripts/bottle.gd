extends Sprite2D

@onready var power_up_sound: AudioStreamPlayer = $PowerUpSound
@onready var collision_shape: CollisionShape2D = $Area2D/CollisionShape2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	power_up_sound.play()
	visible = false
	collision_shape.call_deferred("set", "disabled", true)
	body.start_run_effect()


func _on_power_up_sound_finished() -> void:
	queue_free()
