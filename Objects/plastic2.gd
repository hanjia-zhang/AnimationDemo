extends RigidBody2D

var box
var counter = 0
signal plasticPick2
var item

var active = false

func _process(delta):
	$Instruction.visible = active
	

func _on_Area2D_body_entered(body):
	if body.name == 'PlayerControl':
		active = true
		Input.is_action_pressed("ui_pickup")
		emit_signal("plasticPick2")
		queue_free()


func _on_Area2D_body_exited(body):
	if body.name == 'PlayerControl':
		active = false
