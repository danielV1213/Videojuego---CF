extends KinematicBody2D

export (int) var Velocidad #añadir variable al inspector.
var Movimiento = Vector2()
var puntaje = 0
var limite
export (int) var vida_max = 100
onready var  vida = vida_max 
var barraVida

var velocity : Vector2 = Vector2()
var direction : Vector2 = Vector2()


func _ready():
	limite = get_viewport_rect().size
	barraVida = get_tree().get_nodes_in_group("LBPDV")[0] 
	
func read_input():
	velocity = Vector2()
	
	if Input.is_action_pressed("Izquierda"):
		velocity.x -= 1
		direction = Vector2(-1, 0)
		MusicController.walk_music()
	if Input.is_action_pressed("Adelante"):
		velocity.y -= 1
		direction = Vector2(0, -1)
		MusicController.walk_music()
	if Input.is_action_pressed("Derecha"):
		velocity.x += 1
		direction = Vector2(1, 0)
		MusicController.walk_music()
	if Input.is_action_pressed("Abajo"):
		velocity.y += 1
		direction = Vector2(0, 1)
		MusicController.walk_music()
	
	velocity = velocity.normalized() * Velocidad
	velocity = move_and_slide(velocity * 1.25)
	
	if velocity.x != 0:
		$AnimatedSprite.animation = "lado"
		$AnimatedSprite.flip_h = velocity.x < 0 
	elif velocity.y < 0:
		$AnimatedSprite.animation = "atras"	
	elif velocity.y > 0:
		$AnimatedSprite.animation = "frente"
	else:
		$AnimatedSprite.animation = "Idle"
		MusicController.stop_walk_music()

	vida = clamp(vida, 0, vida_max)
	
	if barraVida.value == 0:
		get_tree().change_scene("res://Escenas/Menu_Principal.tscn")
		
		
func _physics_process(delta):
	read_input()

func _on_Personaje_DV_body_entered(body):
	if body.is_in_group("haceDamage"):
		barraVida.value -= 15
		MusicController.danger_music()
