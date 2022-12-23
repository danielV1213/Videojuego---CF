extends Control

var button_pressed : int = 0
#Funciones para programar las señales de los botones.
func _on_Btn_Jugar_pressed():
	get_tree().change_scene("res://Escenas/Perfiles_Selecc.tscn")

func _on_Btn_Puntaje_pressed():
	print("Aqui Score");
	
func _on_Btn_Ajustes_pressed():
	if Input.is_action_pressed("Aceptar"):
		if get_tree().paused == true:
			get_tree().paused = false
			$Control/efecto.interpolate_property($Control/Control, "rect_position", $Control/Control.rect_position, $Control/Control.rect_position-Vector2(1150,0), 0, Tween.TRANS_BACK, Tween.EASE_IN)
			$Control/efecto.start()
		else:
			get_tree().paused = true
			$Control/efecto.interpolate_property($Control/Control, "rect_position", $Control/Control.rect_position, $Control/Control.rect_position+Vector2(1150,0), 0, Tween.TRANS_BACK, Tween.EASE_IN)
			$Control/efecto.start()
	

func _on_Btn_Salir_pressed():
	get_tree().quit()

func _ready():
	MusicController.play_music()

func _input(event):
	if Input.is_action_pressed("Adelante") || Input.is_action_pressed("Abajo"):
			if Input.is_action_pressed("Adelante"):
				if button_pressed == 0:
					$VBoxBotones/Btn_Jugar.grab_focus()
				elif button_pressed == 1:
					$VBoxBotones/Btn_Jugar.grab_focus()
					button_pressed = 0
				elif button_pressed == 2:
					$VBoxBotones/Btn_Puntaje.grab_focus()
					button_pressed = 1
				elif button_pressed == 3:
					$VBoxBotones/Btn_Ajustes.grab_focus()
					button_pressed = 2
			
			if Input.is_action_pressed("Abajo"):
				if button_pressed == 0:
					$VBoxBotones/Btn_Puntaje.grab_focus()
					button_pressed = 1
				elif button_pressed == 1:
					$VBoxBotones/Btn_Ajustes.grab_focus()
					button_pressed = 2
				elif button_pressed == 2:
					$VBoxBotones/Btn_Salir.grab_focus()
					button_pressed = 3
				elif button_pressed == 3:
					$VBoxBotones/Btn_Salir.grab_focus()

			
			
	if event.is_action_pressed("Aceptar"):
		if $VBoxBotones/Btn_Jugar.has_focus():
			_on_Btn_Jugar_pressed()
		elif $VBoxBotones/Btn_Puntaje.has_focus():
			_on_Btn_Puntaje_pressed()
		elif $VBoxBotones/Btn_Ajustes.has_focus():
			_on_Btn_Ajustes_pressed()
