class_name Monster

extends Node

@export var monster_type : String
@export var monster_name : String

func die():
	print(monster_name + "died")
