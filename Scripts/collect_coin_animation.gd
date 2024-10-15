extends Node

@onready var animated_sprite: AnimatedSprite2D = $"../AnimatedSprite2D"

var coin:Area2D = null
var tween_distance: float = 30
var tween_duration: float = 0.5


func _ready() -> void:
	coin = get_parent()
	coin.body_entered.connect(_on_body_entered)
	
	
func _on_body_entered(_body: Node2D) -> void:
	var tween = get_tree().create_tween().bind_node(coin).set_parallel(true)
	tween.tween_property(coin, "position", coin.position + Vector2.UP*tween_distance, tween_duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(animated_sprite,"self_modulate", Color(Color.WHITE, 0), tween_duration)
	await tween.finished
	coin.queue_free()
