extends Area2D

const TOTAL_COINS: int = 11
@onready var end_score: Label = %EndScore

func _on_body_entered(_body: Node2D) -> void:
	Global.increase_score()
	if Global.get_score() < TOTAL_COINS:
		end_score.text = "Recolecta todas las monedas \n" + str(Global.get_score()) + " de " + str(TOTAL_COINS) + "."
	else:
		end_score.text = "Felicitaciones!! \nhas recolectado todas las monedas."
	queue_free()
