extends StaticBody2D

var puntaje = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.listo = "no"
	$puntajes.connect("body_entered", Callable(self, "_on_body_entered"))
	DialogueManager.show_dialogue_balloon(load("res://dialogs/minijuego3/inicio.dialogue"),"Nivel1")
	
func _on_body_entered(body):
	puntaje = puntaje + 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
