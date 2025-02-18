extends Node2D


const OBJECT_SCENE: PackedScene = preload("res://node_2d.tscn")
var slimeTexture = preload("res://icon.svg")
@onready var spawn_timer =  get_node("spawn_timer")

	
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	add_child(spawn_timer)
	#print("Timer created and added to scene")
	
	spawn_timer.connect("timeout", Callable(self, "_on_spawn_timer_timeout"))
	#print("Timer connected to the 'timeout' sginal.")
	
func _on_spawn_timer_timeout() -> void:
	#print("Timer timeout triggered.")
	spawnSlime(Vector2(randf_range(0,1000),300))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
		


func spawnSlime(spawn_position: Vector2) -> void:
	var new_object = OBJECT_SCENE.instantiate() 
	var sprite = Sprite2D.new()
	sprite.texture = slimeTexture
	new_object.position = spawn_position
	new_object.add_child(sprite)
	add_child(new_object)
	#print("Slime added to scene tree")
