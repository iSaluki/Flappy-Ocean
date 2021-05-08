extends ColorRect




onready var _anim_player := $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	HighScore.visible = false
	_anim_player.play_backwards("Fade")
	_anim_player.play("Fade")
	yield(_anim_player, "animation_finished")
	get_tree().change_scene("res://Game.tscn")


