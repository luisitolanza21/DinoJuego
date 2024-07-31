extends CanvasLayer

var dialogue_res
var dialogue_line = {}

@onready var speaker = $bg/mc/vb/speaker
@onready var fondo_de_texto = $bg
@onready var dialogo_texto = $bg/mc/vb/text
@onready var lista_opciones = $bg/mc/vb/option_list
@onready var boton_de_opciones = $option_ref_button

var esperar_seleccion = false
var caracteres_totales = 0
var typing = false
var escribiendo = 0
var Y_scale = 0

@export var VELOCIDAD_DE_ESCRITURA = 40
 
func _ready():
	DialogueManager.dialogue_ended.connect(fin_dialogo)
	
func iniciar_dialogo(dialogo,inicio):
	dialogue_res = dialogo
	dialogue_line = await DialogueManager.get_next_dialogue_line(dialogo)
	actualizar_dialogo()
	
func get_next_dialogue(next_id):
	dialogue_line = await DialogueManager.get_next_dialogue_line(dialogue_res,next_id)
	actualizar_dialogo()

func _process(delta):
	if Input.is_action_just_pressed("interact"):
		if  typing == false:
			if esperar_seleccion == false:
				get_next_dialogue(dialogue_line.next_id)
			else:
				var first_option = dialogue_line.responses[0].next_id
				get_next_dialogue(first_option)
	process_dialogue_window(delta)

func process_dialogue_window(delta):
	if escribiendo < caracteres_totales:
		escribiendo += VELOCIDAD_DE_ESCRITURA * delta
		dialogo_texto.visible_characters = escribiendo	
	
func actualizar_dialogo():
	Y_scale = 0
	if dialogue_line.is_empty():
		return
	speaker.text = dialogue_line.character
	dialogo_texto.text = dialogue_line.text
	Y_scale += speaker.get_content_height()
	Y_scale += dialogo_texto.get_content_height()
	clear_options()
	set_options()
	caracteres_totales = dialogo_texto.get_total_caracter_count()
	dialogo_texto.visible_characters = 0 
	escribiendo = 0
	typing = true

func set_options():
	if dialogue_line.responses.Size() > 0:
		esperar_seleccion = true
	else:
		esperar_seleccion = false
	var options = dialogue_line.responses
	for i in options.size():
		var opt = boton_de_opciones.duplicate()
		lista_opciones.add_child(opt)
		opt.show()
		opt.text = options[i].text
		set_response_action(opt, options[i].next_id)
		if i == 0:
			opt.grab_focus()
	Y_scale += lista_opciones.size.y
	fondo_de_texto.size.y = Y_scale
	
func clear_options():
	for child in lista_opciones.get_children():
		child.queue_free()

func set_response_action(option_button, next_id):
	option_button.pressed.connect(get_next_dialogue.bind(next_id))



func fin_dialogo():
	queue_free()
