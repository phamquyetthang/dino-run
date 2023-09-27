extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var isHitted = false
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		if velocity.y < 0:
			$AnimatedSprite2D.play("Jump")
		else:
			$AnimatedSprite2D.play("Fall")
	# Handle Jump.
	listin_input()
	if !isHitted:
		velocity.x = SPEED
		$AnimatedSprite2D.play('Run')
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func listin_input():
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY


func hitted():
	isHitted = true
	$AnimatedSprite2D.play("Hit")
