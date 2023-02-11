extends RigidBody2D

var box
var counter = 0
signal pick
var item

var active = false

func _process(delta):
	$Instruction.visible = active
	

func _on_Area2D_body_entered(body):
	if body.name == 'PlayerControl':
		active = true
		print_debug("here")
		Input.is_action_pressed("ui_pickup")
		print_debug("clicked")
		emit_signal("pick")
		queue_free()


func _on_Area2D_body_exited(body):
	if body.name == 'PlayerControl':
		active = false



	
		
