extends Area2D

var active = false 
var greenCardCheck = false
var plasticCheck = false
var message = false
var gb
var pl
var idc


signal IDcheck

func _process(delta):
	$Button.visible = active
	$message.visible = message
	
func _on_craftingIDcard_body_entered(body):
	if body.name == 'PlayerControl' && greenCardCheck == true && plasticCheck == true:
		active = true
	else:
		message = true
	
	
func _on_craftingIDcard_body_exited(body):
	if body.name == 'PlayerControl' && greenCardCheck == true && plasticCheck == true:
		active = false
	else:
		message = false


func _on_Button_pressed():
	if greenCardCheck == true && plasticCheck == true:
		emit_signal("IDcheck")
		gb = 0
		$"../CanvasLayer"._update_greenBoard(gb)
		
		pl = 0
		$"../CanvasLayer"._update_plastic(pl)
		
		idc = 1
		$"../CanvasLayer"._update_IDcard(idc)



func _on_craftingtable_greenboardCheck():
	greenCardCheck = true		




func _on_craftingplastic_plasticCheck():
	plasticCheck = true		











