extends Camera2D

@export var objetct_follow:Node2D


func _process(delta):
	position = objetct_follow.position
