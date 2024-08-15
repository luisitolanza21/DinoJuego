extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.listo = "no"
	DialogueManager.show_dialogue_balloon(load("res://dialogs/minijuego4/inicio4.dialogue"), "Nivel1")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
