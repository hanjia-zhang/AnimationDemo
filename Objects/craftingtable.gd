extends Area2D

var active = false 
var source1 = false
var source2 = false
var message = false
var gb

signal greenboardCheck

func _process(delta):
	$Button.visible = active
	$message.visible = message
	
func _on_craftingtable_body_entered(body):
	if body.name == 'PlayerControl' && source1 == true && source2 == true:
		active = true
	else:
		message = true
func _on_craftingtable_body_exited(body):
	if body.name == 'PlayerControl' && source1 == true && source2 == true:
		active = false
	else:
		message = false


func _on_Button_pressed():
	if source1 == true && source2 == true:
		emit_signal("greenboardCheck")
		gb = 1 
		$"../CanvasLayer"._update_greenBoard(gb)


func _on_pickablebox_pick():
	source1 = true


func _on_PickableBox2_pick2():
	source2 = true
