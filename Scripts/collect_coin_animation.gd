extends Node

var coin:Area2D = null


func _ready() -> void:
	coin = get_parent()
	
	
func _on_body_entered(_body: Node2D) -> void:
	pass
