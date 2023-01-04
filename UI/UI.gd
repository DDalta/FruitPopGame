extends Control

var color_change_chance = Stats.color_change_chance

onready var label = $Label
onready var colorRect = $ColorRect

var colors = {"e30b0b": ["Apple", "Cherry"], "f3f025": ["Banana"], "77cb23": ["Kiwi"], "f88787": ["Melon"], "ff7800": ["Orange", "Pineapple"]}
var current_color = "e30b0b" setget set_current_color

signal color_change(color, fruit_type)

func _ready():
	Stats.connect("score_changed", self, "set_score")
	var color_keys = colors.keys() 
	self.current_color = color_keys[randi() % color_keys.size()]
	
func set_current_color(value):
	current_color = value
	colorRect.color = current_color

func set_score(value):
	label.text = str(value)

	# random chance to change background color
	var randomNumber = rand_range(0, 1)
	if randomNumber <= color_change_chance:
		var color_possibilities = colors.keys() 
		color_possibilities.pop_at(color_possibilities.find(current_color, 0))
		self.current_color = color_possibilities[randi() % color_possibilities.size()]
		emit_signal("color_change", current_color, colors[current_color])
		#colorRect.color = color_keys[randi() % color_keys.size()]
		#current_color = colorRect.color.to_html(false)
