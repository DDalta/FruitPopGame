extends Control

onready var scoreLabel = $ScoreLabel
onready var highScoreLebel = $HighScoreLabel

func _ready():
	scoreLabel.text = "Score: " + str(Stats.score)
	highScoreLebel.text = "HighScore: " + str(Stats.high_score)

func _on_Button_pressed():
	get_tree().change_scene("res://Game.tscn")

func _on_MenuButton_pressed():
	get_tree().change_scene("res://Menu/Menu.tscn")
