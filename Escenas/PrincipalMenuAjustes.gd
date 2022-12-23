extends Control

var column_pressed = 0
var fila_pressed = 0



func cambiarColumna():
	fila_pressed = 0
	
	if column_pressed == 0:
		$Score.grab_focus()
	elif column_pressed == 1:
		$Pause.grab_focus()

func _input(event):
	if Input.is_action_pressed("Adelante"):
		if column_pressed == 0:
			cambiarColumna()
			
		elif column_pressed == 1:
			column_pressed = 0
			cambiarColumna()
			
	if Input.is_action_pressed("Abajo"):
		if column_pressed == 0:
			column_pressed = 1
			cambiarColumna()
			
		elif column_pressed == 1:
			cambiarColumna()
	
	if Input.is_action_pressed("Izquierda"):
		if column_pressed == 0:
			if fila_pressed == 0:
				$Score.grab_focus()
				
			elif fila_pressed == 1:
				fila_pressed = 0
				$Score.grab_focus()
				
		else:
			if fila_pressed == 0:
				$Pause.grab_focus()
				
	if Input.is_action_pressed("Derecha"):
		if column_pressed == 0:
			if fila_pressed == 0:
				$Volume.grab_focus()
				fila_pressed = 1
				
			elif fila_pressed == 1:
				$Volume.grab_focus()
				
		else:
			if fila_pressed == 0:
				$Pause.grab_focus()
				
	if Input.is_action_pressed("Aceptar"):
		if $Pause.has_focus():
			_on_Pause_pressed()
		if $Score.has_focus():
			print("Puntajes")
		if $Volume.has_focus():
			print("Quitar volumen")


func _on_Pause_pressed():
	get_tree().paused = false
	get_node("../efecto").interpolate_property(get_node("."), "rect_position", get_node(".").rect_position, get_node(".").rect_position-Vector2(1150,0), 0.5, Tween.TRANS_BACK, Tween.EASE_IN)
	get_node("../efecto").start()


func _on_Volume_pressed():
	if MusicController.get_node("Music").playing:
			MusicController.stop_music()
			MusicController.muted = true
			$Volume.texture_normal = load("res://Recursos/Imágenes/audioOn.png")
	
	else:
		MusicController.play_music()
		MusicController.muted = false
		$Volume.texture_normal = load("res://Recursos/Imágenes/audioOff.png")


func _on_Score_pressed():
	pass # Replace with function body.
