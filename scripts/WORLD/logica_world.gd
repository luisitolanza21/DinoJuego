extends Node


func _ready():
	# Cargar el recurso de diálogo
	if Misiones.mision == 1:
		var dialogue_resource = load(Misiones.get_current_dialogue_path())
		# Mostrar el diálogo
		DialogueManager.show_dialogue_balloon(dialogue_resource)
		Misiones.mision = 2
		Misiones.cargar_mision(Misiones.mision)
		print("estado mision: ", Misiones.mision)

