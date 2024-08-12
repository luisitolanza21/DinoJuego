extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_pressed():
	Transicion.cambiar_escena("res://scenes/minijuego3/nivel1/ciudadminijuego3_1.tscn")
