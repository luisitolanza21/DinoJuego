class_name AutoPolicia
extends CharacterBody2D

@export var MAX_SPEED = 500.0
@export var ACCELERATION = 500.0
@export var DECELERATION = 200.0
@export var vida=3;

@onready var animacionAdelante=$avanzando;

var velocity_target = Vector2.ZERO
var is_immune = false  # Bandera para indicar si el coche es inmune


	
func _physics_process(delta):
	var input_direction = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	var input_vertical = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	var is_braking = Input.is_action_pressed("ui_accept")  # Suponiendo que "ui_accept" es la acción de la barra espaciadora
	
	
	# Aceleración horizontal
	if input_direction > 0:
		animacionAdelante.play("adelante");
		velocity_target.x = clamp(velocity_target.x + ACCELERATION * delta, 0, MAX_SPEED)
	elif input_direction < 0:
		animacionAdelante.play("adelante");
		velocity_target.x = clamp(velocity_target.x - ACCELERATION * delta, -MAX_SPEED, 0)
	else:
		# Desaceleración horizontal
		velocity_target.x = move_toward(velocity_target.x, 0, DECELERATION * delta)

	if velocity_target.x==0:
		animacionAdelante.play("idle");

	if input_vertical > 0:
		velocity_target.y = clamp(velocity_target.y + ACCELERATION * delta, 0, MAX_SPEED)
	elif input_vertical < 0:
		velocity_target.y = clamp(velocity_target.y - ACCELERATION * delta, -MAX_SPEED, 0)
	else:
		# Desaceleración vertical
		velocity_target.y = move_toward(velocity_target.y, 0, DECELERATION * delta)

			# Frenado (se aplica si se presiona la barra espaciadora)
	if is_braking:
		velocity_target.x = move_toward(velocity_target.x, 0, DECELERATION * delta * 2)  # Frenado más rápido
		velocity_target.y = move_toward(velocity_target.y, 0, DECELERATION * delta * 2)
		# Aplicamos la velocidad
	velocity.x = move_toward(velocity.x, velocity_target.x, ACCELERATION * delta)
	velocity.y = move_toward(velocity.y, velocity_target.y, ACCELERATION * delta)
	move_and_slide()
	
func efecto_por_pisar_aceite():
	velocity_target = velocity_target.rotated(randf_range(-0.1, 0.1))  # Aceleración en dirección aleatoria
	velocity_target *= 1.2  # Incremento repentino de velocidad para simular la falta de control
	ACCELERATION *= 0.2  # Menos tracción
	DECELERATION *= 0.1  # Deslizamiento prolongado

	# Recuperar lentamente las propiedades normales después de 2 segundos
	await get_tree().create_timer(2.0).timeout
	ACCELERATION = 500.0
	DECELERATION = 200.0
	

func _on_area_2d_area_entered(area):
	print("Chocó con algo")




