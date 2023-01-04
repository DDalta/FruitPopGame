extends Node

export(int) var fruit_speed = 50 setget set_fruit_speed
export(float) var timer_duration = 0.5 setget set_timer_duration
export(float) var color_change_chance = 0.1 setget set_color_change_chance
export(int) var score = 0 setget set_score

var high_score = 0

signal score_changed(value)
signal game_status_changed(value)

func set_fruit_speed(value):
	fruit_speed = min(value, 100)

func set_timer_duration(value):
	timer_duration = max(value, 0.2)
	
func set_color_change_chance(value):
	color_change_chance = min(value, 0.3)

func set_score(value):
	score = value
	emit_signal("score_changed", score)
