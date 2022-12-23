extends Control


var column_pressed = 0
var fila_pressed = 0

func _ready():
	if MusicController.muted:
		get_node("../../../../AudioStreamPlayer").volume_db = -100.0
		$Volume.texture_normal = load("res://Recursos/Imágenes/audioOn.png")

func cambiarColumna():
	fila_pressed = 0
	
	if column_pressed == 0:
		$Score.grab_focus()
	elif column_pressed == 1:
		$Left.grab_focus()

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
				$Left.grab_focus()
				
			elif fila_pressed == 1:
				$Left.grab_focus()
				fila_pressed = 0
			
			elif fila_pressed == 2:
				$Pause.grab_focus()
				fila_pressed = 1
				
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
				fila_pressed = 1
				
			elif fila_pressed == 1:
				$Exit.grab_focus()
				fila_pressed = 2
			
			elif fila_pressed == 2:
				$Exit.grab_focus()
				
	if Input.is_action_pressed("Aceptar"):
		if $Left.has_focus():
			_on_Left_pressed()
		if $Exit.has_focus():
			_on_Exit_pressed()
		if $Pause.has_focus():
			_on_Pause_pressed()
		if $Score.has_focus():
			print("Puntajes")
		if $Volume.has_focus():
			_on_Volume_pressed()


func _on_Left_pressed():
	get_tree().change_scene("res://Escenas/Perfiles_Selecc.tscn")
	_on_Pause_pressed()
	MusicController.play_music()


func _on_Pause_pressed():
	get_tree().paused = false
	get_node("../efecto").interpolate_property(get_node("."), "rect_position", get_node(".").rect_position, get_node(".").rect_position-Vector2(250,0), 1, Tween.TRANS_BACK, Tween.EASE_IN)
	get_node("../efecto").start()


func _on_Exit_pressed():
	get_tree().change_scene("res://Escenas/Menu_Principal.tscn")
	_on_Pause_pressed()


func _on_Volume_pressed():
	if Input.is_action_pressed("Aceptar"):
		if get_node("../../../../AudioStreamPlayer").volume_db == -20.0:
			get_node("../../../../AudioStreamPlayer").volume_db = -100.0
			MusicController.muted = true
			$Volume.texture_normal = load("res://Recursos/Imágenes/audioOn.png")
	
		else:
			get_node("../../../../AudioStreamPlayer").volume_db = -20.0
			MusicController.muted = false
			$Volume.texture_normal = load("res://Recursos/Imágenes/audioOff.png")
	
	


func _on_Score_pressed():
	pass # Replace with function body.
