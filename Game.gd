extends Node2D

const Fruit = preload("res://Fruits/Fruit.tscn")

onready var timer = $Timer
onready var UI = $Control
onready var fruitContainer = $Fruits

func _ready():
	randomize()
	Stats.fruit_speed = 50
	Stats.timer_duration = 0.5
	Stats.score = 0
	timer.start(0.1)

func check_fruit(animation, player_tapped):
	if player_tapped:
		if animation in UI.colors[UI.current_color]:
			Stats.score += 1
		else:
			end_game()
	else:
		if animation in UI.colors[UI.current_color]:
			end_game()

func end_game():
	if Stats.score > Stats.high_score:
			Stats.high_score = Stats.score
	get_tree().change_scene("res://GameOver/GameOver.tscn")

func free_children(parent_node):
	for children in parent_node.get_children():
		children.queue_free()

func increase_difficulty():
	Stats.fruit_speed += 2
	Stats.timer_duration -= 0.04

func _on_Timer_timeout():
	var fruit = Fruit.instance()
	fruitContainer.add_child(fruit)
	fruit.connect("marked_to_delete", self, "check_fruit")
	timer.start(Stats.timer_duration)

func _on_Control_color_change(color, fruit_type):
	Stats.color_change_chance = 0
	free_children(fruitContainer)
	increase_difficulty()
