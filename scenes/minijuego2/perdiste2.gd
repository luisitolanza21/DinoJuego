extends Button


@export var perdiste_path = "res://scenes/minijuego3/nivel1/ciudadminijuego3_1.tscn"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	Transicion.cambiar_escena("res://scenes/minijuego2/persecucion_(main).tscn")
