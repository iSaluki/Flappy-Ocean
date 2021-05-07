extends Node2D

var rng = RandomNumberGenerator.new()
var score = 0
var player = preload("res://Player.tscn").instance()
var highScore

# Called when the node enters the scene tree for the first time.
#func _ready():
#	player.connect("tree_exiting",self, "save")
#	# Load high score
#	var file = File.new()
#	file.open("user://user.dat", File.READ)
#	highScore = file.get_as_text()
#	highScore = int(highScore)
#	file.close()
#	$HighScore.set_text(str(highScore))


#func save():
#	if score > highScore:
#		var file = File.new()
#		file.open("user://user.dat", File.READ)
#		highScore = file.get_as_text()
#		print(highScore)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rng.randomize()
	var randNum = rng.randf_range(0.0, 100.0)
	if randNum > 95:
		var spike = preload("res://Spike.tscn").instance()
		add_child(spike)
		spike.connect("tree_exiting", self, "increaseScore")

func increaseScore():
	score += 1
	$Score.set_text(str(score))
#	print(score)
