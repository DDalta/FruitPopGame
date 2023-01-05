extends KinematicBody2D

const PopEffect = preload("res://Effects/FruitPopEffect.tscn")

var SPEED = Stats.fruit_speed

onready var animatedSprite = $AnimatedSprite
onready var fruit_animations = animatedSprite.frames.get_animation_names()

signal marked_to_delete(animation, player_tapped)

var velocity = Vector2.ZERO

func _ready():
	animatedSprite.animation = pick_fruit()
	animatedSprite.frame = rand_range(0, 16)
	global_position.x = rand_range(15, 80)
	global_position.y = -50

func _physics_process(delta):
	var target = Vector2(0, SPEED)
	velocity = move_and_slide(target)
	
	if global_position.y > 180:
		emit_signal("marked_to_delete", animatedSprite.animation, false)
		queue_free()

func create_pop_effect():
	var popEffect = PopEffect.instance()
	get_parent().add_child(popEffect)
	popEffect.global_position = global_position

func pick_fruit():
	var randomNumber = rand_range(0, 1)
	if randomNumber <= 0.58:
		var fruits = Stats.colors[Stats.current_color]
		return fruits[randi() % fruits.size()]
	else:
		return fruit_animations[randi() % fruit_animations.size()]

func _on_Fruit_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			Stats.color_change_chance += 0.01
			emit_signal("marked_to_delete", animatedSprite.animation, true)
			create_pop_effect()
			queue_free()

