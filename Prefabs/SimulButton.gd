extends Node2D

var playerTriggered = false
var playermirrorTriggered = false

var normalColor = '#4361ee'
var pressedColor = '#566ee0'

func _on_Area2D_body_entered(body):
	if "Player" or "PlayerMirror" in body.name:
		$AudioStreamPlayer.play()
		$Area2D/Sprite.modulate = Color(pressedColor)
#		triggered += 1


func _on_Area2D_body_exited(body):
	if "Player" or "PlayerMirror" in body.name:
		$Area2D/Sprite.modulate = Color(normalColor)
#		triggered -= 1
