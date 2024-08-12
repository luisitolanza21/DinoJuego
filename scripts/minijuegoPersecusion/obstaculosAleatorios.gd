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
	var new_obs = autoObstaculo.instantiate()

	# Asignar una posición aleatoria en y
	var x=-100;
	# Si super la velocidad de DINOMOVIL se genera a una distancia de  -200 del DINOMOVIL
	# caso contrario se genera a 200 mas adelante del dinomovil
	#if new_obs.MAX_SPEED > autoPolicia.MAX_SPEED:
	#	print("Generado ATRAS del dinomovil")
	#	x=autoPolicia.position.x -200;
	#else:
	print("Generado delante del dinomovil")
	x=autoPolicia.position.x + 1200;
	
	var y=396;
	
	var aleatoriedad=randi_range(1, 5);
	if aleatoriedad==1:
		y=396;
	elif aleatoriedad==2:
		y=466;
	elif aleatoriedad==3:
		y=530;
	elif aleatoriedad==5:
		y=589;
	
	
	new_obs.position = Vector2(x, y);
	# Añadir el nuevo obstáculo a la escena actual
	add_child(new_obs)


