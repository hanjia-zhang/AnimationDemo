extends Area2D

onready var anim = $"Door Animation2"
onready var block = $"Door Body2/Door Body Collider2"
onready var collider = $"Door Collider2"

func _ready():
	pass

func _on_Door2_body_entered(body):
	if body.name == "Player":
		anim.play("Open")


	


func _on_Door_Animation2_animation_finished(anim_name):
	if anim_name == "Open":
		block.disabled == true
		get_tree().change_scene("res://Scenes/MainMenu.tscn")
