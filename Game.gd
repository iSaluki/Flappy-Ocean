extends Node2D

var rng = RandomNumberGenerator.new()
var score = 0
var player = preload("res://Player.tscn").instance()
var spike = preload("res://Spike.tscn").instance()
var highScore

# Called when the node enters the scene tree for the first time.
func _ready():
	spike.connect("increaseScore", self, "increaseScore")
	HighScore.visible = true
	# Load high score
	var file = File.new()
	file.open("user://user.dat", File.READ_WRITE)
	highScore = file.get_as_text()
	file.close()
	HighScore.get_node("HighScore").set_text(highScore)

func save():
	if score > int(highScore):
		var file = File.new()
		file.open("user://user.dat", File.WRITE)
		file.store_string(str(score))
		file.close()

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
