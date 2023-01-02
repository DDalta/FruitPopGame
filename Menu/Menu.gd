extends Node2D

const StaticFruit = preload("res://Menu/StaticFruit.tscn")

onready var timer = $Timer
onready var colorRect = $UI/ColorRect
onready var fruitContainer = $UI/FruitContainer

func _on_Start_pressed():
	get_tree().change_scene("res://Game.tscn")

func _on_Timer_timeout():
	var fruit = StaticFruit.instance()
	fruitContainer.add_child(fruit)
