extends KinematicBody2D

var speed = 200
var gravity = 100
var movevelocity = 200
var velocity = Vector2()
signal save_now


func _ready():
	pass

func get_collisions():
	pass


func get_input():
	if Input.is_action_pressed("jump"):
		velocity.y = -movevelocity
	if Input.is_action_pressed("escape"):
		get_tree().change_scene("res://Menu.tscn")

func Kill():
	get_tree().change_scene("res://SceneTransition.tscn")
	emit_signal("save_now")

func _physics_process(delta):
	global_position.x = 0
	velocity.y = gravity
	get_input()
	get_collisions()
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		Kill()
