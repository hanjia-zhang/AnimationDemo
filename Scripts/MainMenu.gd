extends CanvasLayer



func _on_Start_pressed():
	get_tree().change_scene("res://Scenes/FirstLevel.tscn")


func _on_Start2_pressed():
	get_tree().change_scene("res://Scenes/Sub-Main.tscn")


func _on_Start3_pressed():
	$Panel.visible = true


func _on_close_pressed():
	$Panel.visible = false
	$Panel2.visible = false


func _on_Start4_pressed():
	$Panel2.visible = true
