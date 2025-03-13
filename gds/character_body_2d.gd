extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0
var direction = 1
@onready var sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision: CollisionShape2D = $CollisionShape2D
@onready var raycast_right = $RayCast2D_Right
@onready var raycast_left = $RayCast2D_Left

func _ready() -> void:
	var faceway = randi_range(0,1)
	if faceway==0:
		direction = -1
	if faceway==1:
		direction=1

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	#change direction on hit wall
	if (direction == 1 and raycast_right.is_colliding()) or (direction == -1 and raycast_left.is_colliding()):
		direction *= -1
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if direction == -1:
		sprite_2d.flip_h = true
	else:
		sprite_2d.flip_h = false
		
	velocity.x = direction * SPEED
	
	move_and_slide()
