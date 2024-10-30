extends CanvasLayer

@onready var coins: Label = $coins

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = true
	Global.score_updated.connect(_on_score_updated)
	coins.text = "0"

func _on_score_updated(score: int):
	coins.text = str(score)
