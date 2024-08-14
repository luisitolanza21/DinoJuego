extends Node2D

var autoObstaculo=load("res://scenes/minijuegoPersecusion/autoObstaculo.tscn")
var autoPolicia;

# Called when the node enters the scene tree for the first time.
func _ready():
	autoPolicia=get_node("../../DINOMOVIL");
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $TiempoGen.is_stopped():
		create_obstacles();
		$TiempoGen.start();

		
	
		
func create_obstacles():
	# Instanciar la escena del auto obstáculo


	# Asignar una posición aleatoria en y
	var x=-100;
	# Si super la velocidad de DINOMOVIL se genera a una distancia de  -200 del DINOMOVIL
	# caso contrario se genera a 200 mas adelante del dinomovil
	#if new_obs.MAX_SPEED > autoPolicia.MAX_SPEED:
	#	print("Generado ATRAS del dinomovil")
	#	x=autoPolicia.position.x -200;
	#else:
	print("Generado delante del dinomovil")
	x=autoPolicia.position.x + 1600;
	
	var vec_carriles=[false, false, false, false, false]
	
	
	var y=396;
	var new_obs = autoObstaculo.instantiate()
	
	
	var nroCarrilesAparecer=randi_range(1, 3);
	while(nroCarrilesAparecer>0):
		var carrilSeleccionado=randi_range(0, 3);
		vec_carriles[carrilSeleccionado]=true;
		nroCarrilesAparecer=nroCarrilesAparecer-1;
		
	if vec_carriles[0]:
		y=396;
		
		new_obs = autoObstaculo.instantiate()

		new_obs.position = Vector2(x, y);
		
		# Añadir el nuevo obstáculo a la escena actual
		add_child(new_obs)
		vec_carriles[0]=false;
	if vec_carriles[1]:
		y=466;
		new_obs = autoObstaculo.instantiate()

		new_obs.position = Vector2(x, y);
		# Añadir el nuevo obstáculo a la escena actual
		add_child(new_obs)
		vec_carriles[1]=false;
		
	if vec_carriles[2]:
		y=530;
		new_obs = autoObstaculo.instantiate()
		new_obs.position = Vector2(x, y);
		# Añadir el nuevo obstáculo a la escena actual
		add_child(new_obs)
		vec_carriles[2]=false;
		
	if vec_carriles[3]:
		y=589;
		new_obs = autoObstaculo.instantiate()
		new_obs.position = Vector2(x, y);
		# Añadir el nuevo obstáculo a la escena actual
		add_child(new_obs)
		vec_carriles[3]=false;
	



