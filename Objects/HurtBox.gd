extends Area2D



var invincible = false setget setInvincible

signal invinciStart
signal invinciEnd



func setInvincible(val):
	invincible = val
	if invincible == true:
		emit_signal("invinciStart")
	else:
		emit_signal("invinciEnd")

func HitEffect():

	var main = get_tree().current_scene



func StartInvinc(duration):
	self.invincible = true


func _on_Timer_timeout():
	self.invincible = false


func _on_Hurtbox_invinciStart():
	set_deferred("monitorable", false)
	monitorable = false


func _on_Hurtbox_invinciEnd():
	monitorable = true



