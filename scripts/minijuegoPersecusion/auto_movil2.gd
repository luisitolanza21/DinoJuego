extends CharacterBody2D

@export var MAX_SPEED = 500.0
@export var ACCELERATION = 500.0
@export var DECELERATION = 200.0

@onready var animacionAdelante=$avanzando;

var velocity_target = Vector2.ZERO


	
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

	# Aceleración vertical (solo si hay movimiento horizontal)
	if abs(velocity.x) > 0.1:  # Pequeña tolerancia para evitar saltos

		if input_vertical > 0:
			velocity_target.y = clamp(velocity_target.y + ACCELERATION * delta, 0, MAX_SPEED)
		elif input_vertical < 0:
			velocity_target.y = clamp(velocity_target.y - ACCELERATION * delta, -MAX_SPEED, 0)
		else:
			# Desaceleración vertical
			velocity_target.y = move_toward(velocity_target.y, 0, DECELERATION * delta)
	else:
		velocity_target.y = 0  # Forzar a detener el movimiento vertical
		animacionAdelante.play("idle");
			# Frenado (se aplica si se presiona la barra espaciadora)
	if is_braking:
		velocity_target.x = move_toward(velocity_target.x, 0, DECELERATION * delta * 2)  # Frenado más rápido
		velocity_target.y = move_toward(velocity_target.y, 0, DECELERATION * delta * 2)
		# Aplicamos la velocidad
	velocity.x = move_toward(velocity.x, velocity_target.x, ACCELERATION * delta)
	velocity.y = move_toward(velocity.y, velocity_target.y, ACCELERATION * delta)
	move_and_slide()

