extends Area2D

func _on_Area2D_body_entered(body):
	var llaves = get_node("../../Personaje_DV/Camera2D/GUI/Obtenidos/RecogidosSound")
	llaves.set_text(str(int(llaves.text)+1))
	get_node(".").queue_free()
	MusicController.coin_music()
