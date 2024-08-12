extends Node
# MISION INICIA EN 0
# CONTINUACION INICA EN 1
@export var mision: int = 3 # Variable para controlar la misión actual
@export var continuacion: int =  2# variable para controlar dialogo dentro de las mismas misiones
@export var esta_en_world: bool = true

@export var coronel_position: Vector2 = Vector2(150,450)
@export var npc_mision1_position: Vector2 = Vector2(395,2790)
@export var npc_mision2_position: Vector2 = Vector2(-2320, 2450)
@export var npc_mision4_position: Vector2 = Vector2(3075, 2400)

@export var posicion_indicador: Vector2
# Variable para almacenar el recurso de diálogo
var current_dialogue_path : String = ""


func _ready():
	# Llama a la función para cargar la misión correspondiente al iniciar el juego
	cargar_mision(mision)

func cargar_mision(mision_id: int):
	# Define las rutas de los recursos para cada misión
	match mision_id:
		0:
			current_dialogue_path = "res://dialogs/world/START.dialogue"	
		1:
			current_dialogue_path = "res://dialogs/world/mision_1.dialogue"	
		2:
			current_dialogue_path = "res://dialogs/world/mision_2.dialogue"
		3:
			current_dialogue_path = "res://dialogs/world/mision_3.dialogue"
		4:
			current_dialogue_path = "res://dialogs/world/mision_4.dialogue"
		# Agrega más casos según el número de misiones
		_:
			print("Misión no definida para el ID: ", mision_id)
			current_dialogue_path = ""

func get_current_dialogue_path() -> String:
	return current_dialogue_path

