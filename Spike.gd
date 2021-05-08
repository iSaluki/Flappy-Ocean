extends Sprite


var speed = 10
var velocity = Vector2()
var rng = RandomNumberGenerator.new()

var spike1 = preload("res://spike1.png")
var spike2 = preload("res://spike2.png")

signal increaseScore

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	var textureSet = rng.randi_range(0,1)
	if textureSet == 0:
		self.set_texture(spike1)
	else:
		self.set_texture(spike2)
	var pos = rng.randi_range(0,1)

	global_position.x = 500
	if pos == 0:
		global_position.y = 200
	else:
		global_position.y = -200
		self.flip_v = true


func _physics_process(delta):
	global_position.x -= speed
	
	if global_position.x < -500:
		self.get_parent().remove_child(self)
#	move_and_slide(velocity)


func _on_PointArea_area_entered(area):
	if area.name == "PlayerArea":
		emit_signal("increaseScore")
