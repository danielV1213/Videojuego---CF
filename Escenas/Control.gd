extends Control

func _input(event):
	if Input.is_action_pressed("Escape"):
		_on_Btn_Menu_pressed()

func _on_Btn_Menu_pressed():
	if get_tree().paused == true:
		get_tree().paused = false
		$efecto.interpolate_property($Control, "rect_position", $Control.rect_position, $Control.rect_position-Vector2(250,0), 0, Tween.TRANS_BACK, Tween.EASE_IN)
		$efecto.start()
	else:
		get_tree().paused = true
		$efecto.interpolate_property($Control, "rect_position", $Control.rect_position, $Control.rect_position+Vector2(250,0), 0, Tween.TRANS_BACK, Tween.EASE_IN)
		$efecto.start()
