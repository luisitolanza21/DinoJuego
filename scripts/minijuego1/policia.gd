extends StaticBody2D

@export var player_name = "Player"
@export var escena : String
@export var dialogueResource : DialogueResource
@export var dialogueStart : String = "Start"

func _ready():
	$Area2D.connect("body_entered", Callable(self, "_on_body_entered"))
	$Area2D.connect("body_exited", Callable(self, "_on_body_exited"))

   # Conectar la señal 'listo_changed' a la función '_on_listo_changed'
	Global.connect("listo_changed", Callable(self, "_on_listo_changed"))
	
# Esta función se llamará cuando 'listo' cambie en el script global
#func _on_listo_changed(new_value):
	#print("Global.listo ha cambiado a: ", new_value)
#	Transicion.cambiar_escena(escena)
	# Aquí puedes añadir el código que deseas ejecutar cuando 'listo' cambie


func _on_body_entered(body):
	print(Global.listo)
	if body.name == player_name:
		body.set("current_npc", self)

func _on_body_exited(body):
	print(Global.listo)
	if body.name == player_name:
		body.set("current_npc", null)

func player_interacted():
	Global.todos_los_npc()
	print(Global.puntaje)
	if Global.puntaje > 2:	
		DialogueManager.show_dialogue_balloon(load("res://dialogs/dinodetective1/policia.dialogue"), "start")
	else:
		DialogueManager.show_dialogue_balloon(load("res://dialogs/dinodetective1/policia.dialogue"), "again")
