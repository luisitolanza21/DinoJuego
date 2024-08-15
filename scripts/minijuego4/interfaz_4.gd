extends CanvasLayer

@export var countdown_time = 60 # Tiempo inicial en segundos (ej. 120 segundos = 2 minutos)
var time_remaining: int
var timer: Timer
var rich_text_label: RichTextLabel

var timer_started = false

func _ready():
	# Inicializar variables
	time_remaining = countdown_time
	
	# Obtener la referencia al RichTextLabel
	rich_text_label = $textodelcontador
	
	# Crear e inicializar el Timer (no lo iniciamos aún)
	timer = Timer.new()
	timer.wait_time = 1.0  # Cuenta regresiva de 1 segundo
	timer.connect("timeout", Callable(self, "_on_timeout"))
	add_child(timer)

	# Actualizar el RichTextLabel con el tiempo inicial
	update_timer_label()

func _process(delta):
	# Verificar si Global.listo es "si" y el temporizador aún no ha comenzado
	if Global.listo == "si" and not timer_started:
		timer.start()
		timer_started = true

func _on_timeout():
	# Reducir el tiempo restante
	time_remaining -= 1
	
	# Actualizar el RichTextLabel
	update_timer_label()
	
	# Si el tiempo llega a 0, detener el Timer
	if time_remaining <= 0:
		timer.stop()
		Global.listo = "no"
		Transicion.cambiar_escena("res://scenes/world.tscn")

func update_timer_label():
	# Convertir el tiempo restante en minutos y segundos
	var minutes = time_remaining / 60
	var seconds = time_remaining % 60
	
	# Formatear el texto como "MM:SS"
	var time_text = "%02d:%02d" % [minutes, seconds]
	
	# Actualizar el texto del RichTextLabel
	rich_text_label.text = time_text
