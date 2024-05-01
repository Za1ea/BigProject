extends CharacterBody2D


@export var speed : float = 500.0
@export var gravity : float = 40.0
@export var JUMP_VELOCITY : float = 10.0
@export var lives : int = 3

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	#velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")*150
	#move_and_slide()
	
	# Add the gravity.
	#if not is_on_floor():
		#velocity.y -= gravity * delta

	# Handle jump.
	#if Input.is_action_just_pressed("up") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_up", "move_down")
	if direction:
		velocity.y = direction * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed)
	

	move_and_slide()
	
	global_position = global_position.clamp(Vector2(0, 120), get_viewport_rect().size - Vector2(0, 100))
	


func _on_body_entered(body):
	if body.obj == "trash":
		global.obstacle_score += 1
		body.queue_free()
	else:
		global.obstacle_score = min(0, global.obstacle_score - 1)
		lives -= 1
		$Sub.play("damage")
		await get_tree().create_timer(1.0).timeout
		$Sub.stop()
		if lives == 0:
			SceneTransition.change_scene("res://lose_screen.tscn", "")
