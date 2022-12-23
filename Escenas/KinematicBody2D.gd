extends KinematicBody2D

export (int) var Velocidad #añadir variable al inspector.
var Movimiento = Vector2()
var puntaje = 0
var limite
export (int) var vida_max = 100
onready var  vida = vida_max 
var barraVida
onready var labelSound = get_node("Camera2D/GUI/Obtenidos/RecogidosSound")


func _ready():
	limite = get_viewport_rect().size
	barraVida = get_tree().get_nodes_in_group("LBPDV")[0] 
	
func _process(delta):
	Movimiento = Vector2()
	if Input.is_action_pressed("Izquierda"):
		Movimiento.x -= 1
		MusicController.walk_music()
	if Input.is_action_pressed("Adelante"):
		Movimiento.y -= 1
		MusicController.walk_music()
	if Input.is_action_pressed("Derecha"):
		Movimiento.x += 1
		MusicController.walk_music()
	if Input.is_action_pressed("Abajo"):
		Movimiento.y += 1
		MusicController.walk_music()
	if Movimiento.length() > 0:
		Movimiento = Movimiento.normalized() * Velocidad
	position += Movimiento * delta
	position.x = clamp(position.x, 0, limite.x)
	position.y = clamp(position.y, 0, limite.y)
	
	if Movimiento.x != 0:
		$AnimatedSprite.animation = "lado"
		$AnimatedSprite.flip_h = Movimiento.x < 0 
	elif Movimiento.y < 0:
		$AnimatedSprite.animation = "atras"	
	elif Movimiento.y > 0:
		$AnimatedSprite.animation = "frente"
	else:
		$AnimatedSprite.animation = "Idle"
		MusicController.stop_walk_music()

	vida = clamp(vida, 0, vida_max)
	
	if barraVida.value == 0:
		get_tree().change_scene("res://Escenas/Menu_Principal.tscn")#Cambia al perder
		
		
	labelSound.set_text(str(puntaje))
		
