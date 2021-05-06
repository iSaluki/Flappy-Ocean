extends Sprite


var speed = 10
var velocity = Vector2()
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	var pos = rng.randi_range(0,1)
	
	global_position.x = 500
	print(pos)
	if pos == 0:
		print("top")
		global_position.y = 200
	else:
		print("bottom")
		global_position.y = -200
		self.flip_v = true


func _physics_process(delta):
	global_position.x -= speed
	
	if global_position.x < -500:
		self.get_parent().remove_child(self)
#	move_and_slide(velocity)
