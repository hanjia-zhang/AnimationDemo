extends KinematicBody2D

export(int) var speed = 80.0
var dash_duration = 0.1
var dash_cooldown = 1.0
var dash_time = 0.1
var isDash = false
var velocity = Vector2.ZERO
var isAttack = false
var stats = PlayerStats


func _ready():
	stats.connect("noHealth", self, "_die")

func _physics_process(delta):
	
	
	var dashVector = Vector2.DOWN
	
	if dash_time > dash_duration:
		isDash = false
	
	if isDash:
		dash_time += delta
		
	if not isDash and not isAttack:
		speed = 0

		if Input.is_action_pressed("ui_right"):
			velocity = Vector2.ZERO	
			velocity.x = 1.0
			speed = 80
			
		if Input.is_action_pressed("ui_left"):
			velocity = Vector2.ZERO	
			velocity.x = -1.0
			speed = 80
			
		if Input.is_action_pressed("ui_down"):
			velocity = Vector2.ZERO	
			velocity.y = 1.0
			speed = 80
			
		if Input.is_action_pressed("ui_up"):
			velocity = Vector2.ZERO	
			velocity.y = -1.0
			speed = 80
			
		if Input.is_action_just_pressed("Dash") and not isAttack:
			speed = 400
			dash_duration = 0.1
			dash_cooldown = 1.0
			dash_time = 0.0
			isDash = true
			
		if Input.is_action_just_pressed("Attack") and not isDash:
			isAttack = true
			speed = 0
			
	velocity = velocity.normalized()
	if isAttack:
		$AnimationTree.get("parameters/playback").travel("Attack")
		$AnimationTree.set("parameters/Attack/blend_position", velocity)

	
	elif velocity == Vector2.ZERO or speed == 0:
		$AnimationTree.get("parameters/playback").travel("Idle")
		
	else:
		$AnimationTree.get("parameters/playback").travel("walk")
		$AnimationTree.set("parameters/walk/blend_position", velocity)
		$AnimationTree.set("parameters/Idle/blend_position", velocity)
	
	move_and_slide(velocity * speed)
	
func changeAttackStaus():
	isAttack = false
	
func _die():
	queue_free()
	get_tree().change_scene("res://Scenes/Lose.tscn")

func _on_Hurtbox_area_entered(area):
	stats.health -= 1
