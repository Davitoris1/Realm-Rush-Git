class_name Player 

extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -600.0
var direction = 1.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if $"../Control/Label".visible==false:
			
		# Handle jump.
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		
		velocity.x = SPEED * direction
		if Input.get_axis("ui_left", "ui_right"):
			direction = Input.get_axis("ui_left", "ui_right")
		
		#Input.get_axis("ui_left", "ui_right")
		#	velocity.x = move_toward(velocity.x, 300, SPEED)

		move_and_slide()
