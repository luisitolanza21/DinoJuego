extends RichTextLabel

# El texto completo que quieres mostrar con BBCode
var full_text = "ELIGE AL CULPABLE"

# El tiempo entre cada letra (en segundos)
var letter_interval = 0.02
var aux = ""

# Llama cuando el nodo entra en el árbol de la escena por primera vez
func _ready():
	# Inicializa el texto vacío con BBCode habilitado
	bbcode_enabled = true
	text = ""
	
	# Llama a la función para mostrar el texto letra por letra
	show_text()

# Función para mostrar el texto letra por letra
func show_text():
	var length = full_text.length()
	for i in range(length):
		await get_tree().create_timer(letter_interval).timeout
		text += full_text[i]
	
	# Espera 1 segundo después de mostrar todo el texto
	await get_tree().create_timer(1.5).timeout
	
	# Llama a la función para hacer desaparecer el texto letra por letra
	hide_text()

# Función para hacer desaparecer el texto letra por letra
func hide_text():
	var length = full_text.length()
	for i in range(length):
		await get_tree().create_timer(letter_interval).timeout
		text = text.substr(0, length - i - 1)
