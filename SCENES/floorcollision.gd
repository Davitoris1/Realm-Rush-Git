extends Node2D  # Or TileMap if your floor uses a TileMap

@export var speed: float = 0.6  # Same speed as character

func _process(delta):
	position.x -= speed  # Moves the floor and collisions left
