extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	if $rojo.visible:
		$rojo.visible = false
		$verde.visible = true
		Global.listo2 = "si"
	else:
		$rojo.visible = true
		$verde.visible = false
		Global.listo2 = "si"
		
