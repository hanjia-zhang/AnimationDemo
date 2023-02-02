extends Area2D

onready var anim = $"Gate Animation"
onready var block = $"Gate Body/Gate Body Collider"
onready var collider = $"Gate Collider"

func _ready():
	pass

	


func _on_Area2D_body_entered(body):
	if body.name == "Player" || body.name == "PlayerAlternate":
		anim.play("GateOpen")
