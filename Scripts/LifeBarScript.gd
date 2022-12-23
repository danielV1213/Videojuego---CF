extends ProgressBar

var progreso = 0


func _process(delta):
	get_node(".").value = progreso
	
	if progreso == 25:
		retirarPrimeraPuerta()

func retirarPrimeraPuerta():
	get_node("../../../../Puertas/primeraPuerta").queue_free()
