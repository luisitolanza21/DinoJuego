extends Button

func _on_pressed():
	DialogueManager.show_dialogue_balloon(load("res://dialogs/dinodetective1/seleccion.dialogue"), "incorrecto")
