extends Node


const TOTAL_COINS:int = 11

var _player_score = 0


func increase_score():
	_player_score += 1

func reset_score():
	_player_score = 0
	
func get_score():
	return _player_score
