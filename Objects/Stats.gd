extends Node

export var maxHealth = 1 
var health = maxHealth setget setHealth

var Max_Speed = 100



signal noHealth
signal healthChange(val)
signal maxHealthChange(val)

func _ready():
	self.health = maxHealth


func setHealth(val):
	health = val
	emit_signal("healthChange", health)
	if health <= 0:
		emit_signal("noHealth")
