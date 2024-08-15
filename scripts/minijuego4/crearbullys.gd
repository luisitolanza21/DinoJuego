extends Node2D

var bullys=load("res://scenes/minijuego4/dinobully.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.listo == "si":
		if $TiempoGen.is_stopped():
			var ubicacion = randi() % 5
			var tiempo = randi() % 2 + 1
			create_obstacles(ubicacion);
			$TiempoGen.wait_time = tiempo
			$TiempoGen.start();
		
func create_obstacles(ubicacion):
	var position: Vector2
	var positionrelative: Vector2
	
	match ubicacion:
		0:
			position = Vector2(530, 1000)
		1:
			position = Vector2(685, 1000)
		2:
			position = Vector2(850, 1000)
		3:
			position = Vector2(385, 1000)
		4:
			position = Vector2(995, 1000)


	
	# Verificar si hay un objeto en la posición
	#if is_position_occupied(position):
	#	print(position)
	#	print("La posición ya está ocupada.")
	#	return  # No se instancia nada si la posición está ocupada
	
	# Instanciar la escena del auto obstáculo
	var new_obs

	new_obs = bullys.instantiate()
	new_obs.position = position
	add_child(new_obs)


func is_position_occupied(position: Vector2) -> bool:
	# Crear un objeto de parámetros de consulta
	var query = PhysicsPointQueryParameters2D.new()
	query.position = position
	
	# Realizar la consulta
	var space_state = get_world_2d().direct_space_state
	var result = space_state.intersect_point(query)
	
	# Devolver si se encontró algún cuerpo
	return result.size() > 0
