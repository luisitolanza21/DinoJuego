extends CharacterBody2D


@export var SPEED = 200.0;
@export var FRICCION=0.5;


#vector2d para almacenar las direcciones
var axis : Vector2;
			
func entradasDetectadasPorBoleano() -> Vector2:
	axis.x=int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"));
	axis.y=int(Input.is_action_pressed("ui_up"))-int(Input.is_action_pressed("ui_down"));
	return axis.normalized();


func movimientoPorEntradasBooleanas() -> void:
	velocity.x=entradasDetectadasPorBoleano().x*SPEED;
	velocity.y=entradasDetectadasPorBoleano().y*-SPEED;
	move_and_slide();
	
	
# Get the gravity from the project settings to be synced with RigidBody nodes.
func _movimientoPorTeclasPreConfiguradas():
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	var directionX = Input.get_axis("left", "right")
	var direccionY=Input.get_axis("up","down")
	
	
	if directionX:
		velocity.x = directionX * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if direccionY:
		velocity.y=direccionY*SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()


func _physics_process(delta):
	movimientoPorEntradasBooleanas();

