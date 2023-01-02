extends KinematicBody2D

onready var animatedSprite = $AnimatedSprite
onready var fruit_animations = animatedSprite.frames.get_animation_names()

var SPEED = 35
var velocity = Vector2.ZERO

func _ready():
	animatedSprite.animation = fruit_animations[randi() % fruit_animations.size()]
	animatedSprite.frame = rand_range(0, 16)
	global_position.x = rand_range(15, 80)
	global_position.y = -20

func _physics_process(delta):
	var target = Vector2(0, SPEED)
	velocity = move_and_slide(target)
	
	if global_position.y > 180:
		queue_free()
