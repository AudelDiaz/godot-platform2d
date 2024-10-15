extends Area2D
@onready var trophy: Area2D = $"."

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var timer: Timer = $Timer

var tween_distance: float = 30
var tween_duration: float = 1


func _on_body_entered(_body: Node2D) -> void:
	print("Body has touched Trophy")
	var tween = get_tree().create_tween().bind_node(trophy).set_parallel(true)
	tween.tween_property(trophy, "position", trophy.position + Vector2.UP*tween_distance, tween_duration).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(sprite_2d,"self_modulate", Color(Color.WHITE, 0), tween_duration)
	Global.level_finished(1)
	audio_stream_player_2d.play()
	timer.start()
 

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/congratulations.tscn")
