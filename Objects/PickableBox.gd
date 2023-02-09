extends RigidBody2D

var box
signal pick

var active = false

func _process(delta):
	$Instruction.visible = active

func _on_Area2D_body_entered(body):
	if body.name == 'PlayerControl':
		active = true


func _on_Area2D_body_exited(body):
	if body.name == 'PlayerControl':
		active = false


func _input(event):
	if event.is_action_pressed("ui_pickup"):
		emit_signal("pick")
		queue_free()
