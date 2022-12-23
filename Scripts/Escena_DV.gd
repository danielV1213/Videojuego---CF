extends Node2D
var Puntaje

func _ready():
	randomize()
	MusicController.stop_music()
	
func nuevo_juego():
	Puntaje = 0
	#$Personaje_DV.inicio
	
