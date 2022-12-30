extends Node2D

const Fruit = preload("res://Fruits/Fruit.tscn")

onready var timer = $Timer
onready var UI = $Control
onready var fruitContainer = $Fruits

var duration = Stats.timer_duration

func _ready():
	randomize()
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
			#end_game()
			pass

func end_game():
	if Stats.score > Stats.high_score:
			Stats.high_score = Stats.score
	get_tree().change_scene("res://GameOver/GameOver.tscn")

func free_children(parent_node):
	for children in parent_node.get_children():
		children.queue_free()

func _on_Timer_timeout():
	var fruit = Fruit.instance()
	fruitContainer.add_child(fruit)
	fruit.connect("marked_to_delete", self, "check_fruit")
	timer.start(duration)

func _on_Control_color_change(color, fruit_type):
	free_children(fruitContainer)
