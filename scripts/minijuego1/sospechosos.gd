extends Button

@export var dialogo : String
@export var flag : String

func _ready():
	Global.connect("listo_changed", Callable(self, "_on_listo_changed"))
	
# Esta función se llamará cuando 'listo' cambie en el script global
func _on_listo_changed(new_value):
	#print("Global.listo ha cambiado a: ", new_value)
	if (Global.listo == "si"):
		if(flag == "correcto"):
			Transicion.cambiar_escena("res://scenes/world.tscn")
			Misiones.continuacion += 1  # para continuar los dialogos de la mision 2 o siguiente mision 
			#cargar ultimo dialogo de la mision 2
			# Aquí puedes añadir el código que deseas ejecutar cuando 'listo' cambie
			
func _on_pressed():
	DialogueManager.show_dialogue_balloon(load(dialogo), flag)
