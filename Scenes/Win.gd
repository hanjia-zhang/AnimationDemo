extends CanvasLayer


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://Scenes/FourthLevel.tscn")