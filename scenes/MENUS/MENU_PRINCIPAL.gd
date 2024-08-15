extends Node2D

func _process(delta):
	Global.botones = false
	if Input.is_action_just_pressed("ui_accept"):
		Transicion.cambiar_escena("res://scenes/world.tscn")
