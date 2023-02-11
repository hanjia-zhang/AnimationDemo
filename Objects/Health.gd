extends Control

var heart = 5 setget setHeart

var maxHeart = 5 setget setMaxHeart

onready var heartFull = $Label

func setHeart(val):
	heart = clamp(val, 0, maxHeart)
	if heartFull != null:
		heartFull.text = "HP = " + str(heart)
	
func setMaxHeart(val):
	maxHeart = max(val, 1)
	
	
func _ready():
	self.maxHeart = PlayerStats.maxHealth
	self.heart = PlayerStats.health
	PlayerStats.connect("healthChange", self, "setHeart")
	
