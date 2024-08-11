extends Button
@onready var animated = $animacion
var MAX_SPEED = 0

func _ready():
	animated.play("frente")

func _on_pressed():
	animated.flip_h = true
	if animated.animation == "frente":	
		_mostrar_lado()
	else:
		_mostrar_frente()
		

func _mostrar_frente():
	animated.play("frente")
	MAX_SPEED=randf_range(200, 500);
	print(MAX_SPEED)
	$frenoarriba.position = Vector2(0,0)
	$frenoizquierdo.position = Vector2(0,1200)
	#$frenoizquierdo.hide()

func _mostrar_lado():
	animated.play("lado")
	MAX_SPEED=0;
	$frenoarriba.position = Vector2(0,1200)
	$frenoizquierdo.position = Vector2(0, 0)
	#$frenoizquierdo.show()
