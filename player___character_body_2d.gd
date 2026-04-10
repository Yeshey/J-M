extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump (W or Space)
	if Input.is_action_just_pressed("ui_accept") or Input.is_key_pressed(KEY_W):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY

	# Get WASD/Arrow input
	var direction = Input.get_axis("ui_left", "ui_right") 
	# Note: Godot maps A/D and Left/Right to "ui_left/right" by default!
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
