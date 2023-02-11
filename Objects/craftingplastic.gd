extends Area2D

var active = false 
var plastic1 = false
var plastic2 = false
var message = false
var pl

signal plasticCheck

func _process(delta):
	$Button.visible = active
	$message.visible = message
	
func _on_craftingplastic_body_entered(body):
	if body.name == 'PlayerControl' && plastic1 == true && plastic2 == true:
		active = true
	else:
		message = true
	
func _on_craftingplastic_body_exited(body):
	if body.name == 'PlayerControl' && plastic1 == true && plastic2 == true:
		active = false
	else:
		message = false


func _on_Button_pressed():
	if plastic1 == true && plastic2 == true:
		emit_signal("plasticCheck")
		pl = 1
		$"../CanvasLayer"._update_plastic(pl)



func _on_plastic1_plasticPick1():
	plastic1 = true	



func _on_plastic2_plasticPick2():
	plastic2 = true	









