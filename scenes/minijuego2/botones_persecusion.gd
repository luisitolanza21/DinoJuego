extends CanvasLayer

func _process(delta):
	if Global.botones == true:
		$".".show()
	else:
		$".".hide()
	
