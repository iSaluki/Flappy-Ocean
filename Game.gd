extends Node2D

var rng = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rng.randomize()
	var randNum = rng.randf_range(0.0, 100.0)
	if randNum > 95:
		var spike = preload("res://Spike.tscn").instance()
		add_child(spike)
