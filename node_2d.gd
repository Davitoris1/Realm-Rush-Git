extends Node2D

@export var monster_kill: Monster

func _ready() -> void:
	pass

func _process(delta):
	pass
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and $Control/Label.visible == true:
		$Control/Label.visible = false
