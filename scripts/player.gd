extends CharacterBody2D

const DASH_SPEED =500.0
const SPEED = 130.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jump_count = 0
var max_jumps = 2
var dashing = false
var can_dash = true

@onready var animated_sprite = $PlayerAnimatedSprite2D
@onready var slime = %SlimeShape

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	if is_on_floor():
		jump_count = 0
	# Handle jump.
	if Input.is_action_just_pressed("jump") and jump_count < max_jumps:
		velocity.y = JUMP_VELOCITY
		jump_count += 1

	#start dash
	if Input.is_action_just_pressed("dash") and can_dash:
		dashing = true
		can_dash = false
		$"Dash Timer".start()
		$"Dash Again Timer".start()

	# Get the input direction: -1, 0, 1
	var direction = Input.get_axis("move_left", "move_right")
	
	# Flip the Sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	if is_on_floor and Input.is_action_just_pressed("jump"):
		animated_sprite.play("jump")
	if Input.is_action_just_pressed("dash"):
		animated_sprite.play("dash")
	
	# Apply movement
	if direction:
		if dashing:
			velocity.x = direction * DASH_SPEED
		else:
			velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	#stop the dash
func _on_dash_timer_timeout():
	dashing = false


func _on_dash_again_timer_timeout():
	can_dash = true
