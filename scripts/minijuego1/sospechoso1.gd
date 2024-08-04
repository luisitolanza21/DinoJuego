extends Button

func _ready():
	Global.connect("listo_changed", Callable(self, "_on_listo_changed"))
	
# Esta función se llamará cuando 'listo' cambie en el script global
func _on_listo_changed(new_value):
	#print("Global.listo ha cambiado a: ", new_value)
	if (Global.listo == "si"):
		Transicion.cambiar_escena("res://scenes/world.tscn")
	# Aquí puedes añadir el código que deseas ejecutar cuando 'listo' cambie
	
func _on_pressed():
	DialogueManager.show_dialogue_balloon(load("res://dialogs/dinodetective1/seleccion.dialogue"), "correcto")
