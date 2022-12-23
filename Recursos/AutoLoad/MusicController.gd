extends Node

var muted = false 

var init_music = load("res://Recursos/Sounds/Introduction_History.mp3")
var danger_effect = load("res://Recursos/Sounds/Danger_Effect.mp3")
var coin_effect = load("res://Recursos/Sounds/Coin_Effect.mp3")
var walking_effect = load("res://Recursos/Sounds/Walk_Effect.wav")

func play_music():
	$Music.stream = init_music
	$Music.volume_db = -15.0
	$Music.play()

func stop_music():
	$Music.stop()

func danger_music():
	if !muted:
		$Sound_Effect.stream = danger_effect
		$Sound_Effect.volume_db = -10.0
		$Sound_Effect.play()

func coin_music():
	if !muted:
		$Sound_Effect.stream = coin_effect
		$Sound_Effect.volume_db = -5.0
		$Sound_Effect.play()

func walk_music():
	if !muted:
		if $Walk_Effect.playing != true:
			$Walk_Effect.stream = walking_effect
			$Walk_Effect.volume_db = -25.0
			$Walk_Effect.play()

func stop_walk_music():
	$Walk_Effect.stop()
