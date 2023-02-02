extends KinematicBody2D

onready var anim = $PlayerSprites

func _ready():
	self.global_position = Vector2(452,282)
	$AnimationPlayer.play("LevelOne")
