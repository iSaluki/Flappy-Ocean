extends Control

var highScore


# Called when the node enters the scene tree for the first time.
func _ready():
	# Load high score
	var file = File.new()
	file.open("user://user.dat", File.READ_WRITE)
	highScore = file.get_as_text()
	file.close()
	HighScore.get_node("HighScore").set_text(highScore)


func _process(delta):
	if $Play.pressed:
		get_tree().change_scene("res://SceneTransition.tscn")
