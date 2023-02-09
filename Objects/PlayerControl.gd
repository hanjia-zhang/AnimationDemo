extends KinematicBody2D

export(int) var speed = 80.0

func _physics_process(delta):
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1.0
		
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1.0
		
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1.0
		
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1.0
		
	velocity = velocity.normalized()
	
	if velocity == Vector2.ZERO:
		$AnimationTree.get("parameters/playback").travel("Idel")
	else:
		$AnimationTree.get("parameters/playback").travel("walk")
		$AnimationTree.set("parameters/walk/blend_position", velocity)
		$AnimationTree.set("parameters/Idle/blend_position", velocity)
	
	move_and_slide(velocity * speed)
	
	
