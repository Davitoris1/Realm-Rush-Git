extends AnimatedSprite2D

const SPEED = 400.0
const JUMP_VELOCITY = -900.0
var player = null


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.get_axis("left", "right"):
		direction = Input.get_axis("left", "right")
	if direction == -1:
		sprite_2d.flip_h = true
	else:
		sprite_2d.flip_h = false
		
	velocity.x = direction * SPEED
	

	move_and_slide()
