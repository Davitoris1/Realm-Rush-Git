extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -900.0
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
var direction = 1


func _physics_process(delta: float) -> void:
	if (velocity.x>1 || velocity.x<-1):
		sprite_2d.animation = 'Running'
	else:
		sprite_2d.animation = 'idle'
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		sprite_2d.animation = "Jump"

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

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
	
	
	
