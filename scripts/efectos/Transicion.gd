extends CanvasLayer

@onready var anim = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	layer = -1
	$AnimationPlayer.play("dinotransicion")

func cambiar_escena(path : String)-> void:
	#este layer es para poner sobre todo el juego la transicion, en frente de todo
	layer = 1
	#sirve para reproducir la animacion de transicion
	print("primero2")
	anim.play("dinotransicion")
	await ($AnimationPlayer. animation_finished)
	print("primero")
	#lo siguiente es el cambio de la escena luego de la animacion
	get_tree().change_scene_to_file(path)
	anim.play_backwards("dinotransicion")
	await ($AnimationPlayer. animation_finished)
	
	print("segundo")
	layer = -1
	
