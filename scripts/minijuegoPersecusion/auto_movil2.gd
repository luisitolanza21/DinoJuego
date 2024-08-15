class_name AutoPolicia
extends CharacterBody2D

@export var MAX_SPEED = 500.0;
@export var ACCELERATION = 300.0;
@export var DECELERATION = 200.0;


@onready var animacionAdelante=$avanzando;
signal player_hit();
signal velocidad_player(velocidad);

var velocity_target = Vector2.ZERO
var is_immune = false  # Bandera para indicar si el coche es inmune

var blink_timer : Timer
var invulnerable = false
var pisoAceite=false;


@onready var acelerar_sonido = $acelerar_sonido
func _physics_process(delta):
	
	if velocity != Vector2.ZERO:
		if not acelerar_sonido.playing:
			acelerar_sonido.play()
	else:
		if acelerar_sonido.playing:
			acelerar_sonido.stop()
	
	var input_direction = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	var input_vertical = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	var is_braking = Input.is_action_pressed("ui_accept")  # Suponiendo que "ui_accept" es la acción de la barra espaciadora
	if Input.is_action_pressed("ui_right") == false:
		acelerar_sonido.stop()

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
		velocity_target.y = clamp(velocity_target.y + 1000 * delta, 0, MAX_SPEED)
	elif input_vertical < 0:
		velocity_target.y = clamp(velocity_target.y - 1000 * delta, -MAX_SPEED, 0)
	else:
		# Desaceleración vertical
		velocity_target.y = 0;

			# Frenado (se aplica si se presiona la barra espaciadora)
	if is_braking:
		velocity_target.x = move_toward(velocity_target.x, 0, DECELERATION * delta * 2)  # Frenado más rápido
		velocity_target.y = move_toward(velocity_target.y, 0, DECELERATION * delta * 2)
		# Aplicamos la velocidad
	velocidad_player.emit(move_toward(velocity.x, velocity_target.x, ACCELERATION * delta));
	velocity.x = move_toward(velocity.x, velocity_target.x, ACCELERATION * delta)
	if(pisoAceite):
		velocity.y = move_toward(velocity.y, velocity_target.y, ACCELERATION * delta)
	else:
		velocity.y =  velocity_target.y
	#
	move_and_slide()
	
func efecto_por_pisar_aceite():
	# Aumentar la velocidad y reducir la aceleración para simular deslizamiento
	velocity_target *= 1.3  # Incremento de velocidad para simular falta de control
	ACCELERATION *= 0.5  # Reducción de tracción
	DECELERATION *= 0.5  # Deslizamiento prolongado
   
	# Aplicar un leve desvío en la dirección horizontal para simular el deslizamiento
	velocity_target.x += randf_range(-100, 100)  # Desvío aleatorio en el eje X
	pisoAceite=true;
	# Recuperar lentamente las propiedades normales después de 2 segundos
	await get_tree().create_timer(2.0).timeout
	pisoAceite=false;
	ACCELERATION = 500.0
	DECELERATION = 200.0


func parpadear():
	invulnerable = true  # Hacer invulnerable al jugador
	for _i in range(10): # Ajusta el número de parpadeos aquí
		$avanzando.visible = not $avanzando.visible
		await get_tree().create_timer(0.3).timeout # Ajusta la velocidad de parpadeo aquí
	$avanzando.visible = true
	
	invulnerable = false  # Finaliza la invulnerabilidad

func bajar_vida():
			# Aplicar un retroceso limitado
	if velocity.x < -MAX_SPEED / 8:
		velocity.x = -MAX_SPEED / 8  # Limit
	if not invulnerable:
		player_hit.emit()
		parpadear()


