extends Node

var highScore


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func save():
	var file = File.new()
	file.open("user://user.dat", File.READ)
	highScore = file.get_as_text()
	highScore = int(highScore)
	file.close()
	$HighScore.set_text(str(highScore))
