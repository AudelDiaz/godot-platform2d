extends Node

var _player_score = 0


func increase_score():
	_player_score += 1
	print(_player_score)

func reset_score():
	_player_score = 0
	
func get_score():
	return _player_score
