extends Node

export(int) var fruit_speed = 50
export(float) var color_change_chance = 0.2
export(float) var timer_duration = 0.5
export(int) var score = 0 setget set_score

var high_score = 0

signal score_changed(value)
signal game_status_changed(value)

func set_score(value):
	score = value
	emit_signal("score_changed", score)
