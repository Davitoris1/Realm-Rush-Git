extends CharacterBody2D

const SPEED = 0.6  # Move speed
const JUMP_VELOCITY = -900.0
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

func _physics_process(delta: float) -> void:
	# Apply gravity correctly
	if not is_on_floor():
		velocity.y += 980 * delta  # Replace get_gravity() with a fixed gravity value
		sprite_2d.animation = "Jump"

	# Handle jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Move only left
	velocity.x = -SPEED  # Character always moves left
	sprite_2d.flip_h = true  # Ensure sprite is facing left

	# Animation logic
	if velocity.x != 0:
		sprite_2d.animation = 'Running'
	else:
		sprite_2d.animation = 'idle'

	move_and_slide()
