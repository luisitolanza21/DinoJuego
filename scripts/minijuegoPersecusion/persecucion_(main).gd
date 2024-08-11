extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Inicio.play("autoEscapando")
	#DialogueManager.show_dialogue_balloon(load("res://dialogs/DialogosPersecusión/dialogosMinijuego2.dialogue"), "dinoDialogoDeLaDinoPersecucion");
	pass;
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
