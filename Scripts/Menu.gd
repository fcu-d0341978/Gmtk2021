extends Node2D

func _ready():
	SignalManager.connect("transitioned", self, "change_scene")

func _on_Button_pressed():
	SignalManager.emit_signal("doTransition")
	$CanvasLayer/Button/AudioStreamPlayer.play()

func change_scene():
#	var level = SaveState.loadGame()
	
#	if level == 0:
	get_tree().change_scene("res://Scene/Level21.tscn")
#	else:
#		get_tree().change_scene("res://Scene/Level" + String(level) + ".tscn")
