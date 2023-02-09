extends Area2D

var active = false




func _process(delta):
	$CollisionShape2D.visible = active



func _on_Area2D_body_entered(body):
	if active == true:
		get_tree().change_scene("res://Scenes/MainMenu.tscn")


func _on_craftingtable_open():	
	active = true
