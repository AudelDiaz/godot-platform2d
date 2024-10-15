extends Area2D

@onready var timer: Timer = $Timer
@onready var dead_sound: AudioStreamPlayer2D = $DeadSound


func _on_body_entered(body: Node2D) -> void:
	print("You are dead!")
	dead_sound.play()
	Global.reset_score()
	Global.increase_deads()
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()


func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
