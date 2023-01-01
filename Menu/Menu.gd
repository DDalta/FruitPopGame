extends Control

onready var colorRect = $ColorRect

func _on_Start_pressed():
	get_tree().change_scene("res://Game.tscn")
