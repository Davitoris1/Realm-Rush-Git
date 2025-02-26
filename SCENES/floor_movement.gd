extends Node2D  # Use this if your floor is a TileMap or a Node2D

@export var speed: float = 0.6  # Same speed as character

func _process(delta):
	position.x -= speed  # Moves the tileset left at a constant speed
