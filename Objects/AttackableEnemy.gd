extends KinematicBody2D

enum {
	Idle,
	Attack,
	Chase
}

export var accel = 200
export var maxSpeed = 50
export var friction = 200

onready var stats = $Stats
onready var Detect = $Detect
onready var hurtBox = $Hurtbox


var velocity = Vector2.ZERO

var state = Chase

func _physics_process(delta):
	
	
	
	if state == Idle:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
		findPlayer()
	elif state == Attack:
		pass
	elif state == Chase:
		var player = Detect.player
		if player != null:
			var direction = (player.global_position - global_position).normalized()
			velocity = velocity.move_toward(direction * maxSpeed, accel * delta)
		else:
			state = Idle
	velocity = move_and_slide(velocity)

func findPlayer():
	if Detect.canSeePlayer():
		state = Chase

func _on_Hurtbox_area_entered(area):
	stats.health -= area.damage
	
	hurtBox.HitEffect()
	print("hit")


func _on_Stats_noHealth():
	queue_free() 


