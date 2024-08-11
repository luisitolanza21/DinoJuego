extends Node2D

var autoObstaculo=load("res://scenes/minijuego3/autos.tscn")
var autoObstaculovertical=load("res://scenes/minijuego3/autosvertical.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $TiempoGen.is_stopped():
		create_obstacles();
		$TiempoGen.start();
		
func create_obstacles():
	# Instanciar la escena del auto obstáculo
	var new_obs = autoObstaculo.instantiate()
	var new_obsvertical = autoObstaculovertical.instantiate()
	#if new_obs:
	#	print("Nuevo obstáculo instanciado.")
	# Asignar una posición aleatoria en y


	
	new_obs.position = Vector2(-780, 70);
	# Añadir el nuevo obstáculo a la escena actual
	add_child(new_obs)
	#print("Obstáculo añadido a la escena. y="+str(y))
	
	
	new_obsvertical.position = Vector2(-250, -550);
	# Añadir el nuevo obstáculo a la escena actual
	add_child(new_obsvertical)
	#print("Obstáculo añadido a la escena. y="+str(y))

