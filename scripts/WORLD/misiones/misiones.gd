extends Node

@export var mision: int = 1  # Variable para controlar la misión actual
@export var continuacion: int = 1 # variable para controlar dialogo dentro de las mismas misiones
@export var esta_en_world: bool = true
# Variable para almacenar el recurso de diálogo
var current_dialogue_path : String = ""


func _ready():
	# Llama a la función para cargar la misión correspondiente al iniciar el juego
	cargar_mision(mision)

func cargar_mision(mision_id: int):
	# Define las rutas de los recursos para cada misión
	match mision_id:
		1:
			current_dialogue_path = "res://dialogs/world/START.dialogue"
		2:
			current_dialogue_path = "res://dialogs/world/coronel_primera_primera_misión.dialogue"
		3:
			current_dialogue_path = "res://dialogs/world/mission3.dialogue"
		4:
			current_dialogue_path = "res://dialogs/world/mission4.dialogue"
		# Agrega más casos según el número de misiones
		_:
			print("Misión no definida para el ID: ", mision_id)
			current_dialogue_path = ""

func get_current_dialogue_path() -> String:
	return current_dialogue_path
