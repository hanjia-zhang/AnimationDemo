extends KinematicBody2D

onready var anim = $PlayerSprites

func _ready():
	self.global_position = Vector2(18,292)
	$AnimationPlayer.play("LevelTwo")
