extends Area2D

var active = false 
var cancraft = false
var message = false

signal open

func _process(delta):
	$Button.visible = active
	$message.visible = message
	
func _on_craftingtable_body_entered(body):
	if body.name == 'PlayerControl' && cancraft == true:
		active = true
	else:
		message = true
func _on_craftingtable_body_exited(body):
	if body.name == 'PlayerControl' && cancraft == true:
		active = false
	else:
		message = false


func _on_Button_pressed():
	if cancraft == true:
		emit_signal("open")


func _on_pickablebox_pick():
	cancraft = true
