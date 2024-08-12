extends Button
@onready var animated = $animacion

@export var defrente : Vector2 = Vector2(0,0)
@export var area2Ddefrente : Vector2 = Vector2(0,0)
@export var vista : String = "abajo"
var animacion1 : String
var animacion2 : String

var MAX_SPEED = 0
var MAX_SPEED_VERTICAL = 0;

func _ready():
	
	if vista == "abajo":
		animacion1 = "no_pasar"
		animacion2 = "pasar"
	else:
		animacion1 = "frente_no_pasar"
		animacion2 = "frente_pasar"
	animated.play(animacion1)
	$frenoarriba.position = defrente
	$frenoizquierdo.position = Vector2(0,2200)
	$izquierda.position = Vector2(0,2200)
	$arriba.position = area2Ddefrente

func _on_pressed():

	if animated.animation == animacion1:	
		_mostrar_lado()
	else:
		_mostrar_frente()
		

func _mostrar_frente():
	animated.play(animacion1)
	MAX_SPEED=randf_range(200, 500);
	MAX_SPEED_VERTICAL = 0;
	$frenoarriba.position = defrente
	#$frenoizquierdo.position = Vector2(0,2200)
	#$izquierda.position = Vector2(0,2200)
	#$arriba.position = area2Ddefrente
	#$frenoizquierdo.hide()

func _mostrar_lado():
	animated.play(animacion2)
	MAX_SPEED=0;
	MAX_SPEED_VERTICAL = 300;
	$frenoarriba.position = Vector2(0,2200)
	#$frenoizquierdo.position = Vector2(0, 0)
	#$izquierda.position = Vector2(0,0)
	#$arriba.position = Vector2(0,2200)
	#$frenoizquierdo.show()
