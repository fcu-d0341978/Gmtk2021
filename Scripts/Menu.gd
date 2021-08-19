extends Node2D

func _ready():
	SignalManager.connect("transitioned", self, "change_scene")

func change_scene():
#	var level = SaveState.loadGame()
	
#	if level == 0:
	get_tree().change_scene("res://Scene/Level31.tscn")
#	else:
#		get_tree().change_scene("res://Scene/Level" + String(level) + ".tscn")


func _on_Start_pressed():
	SignalManager.emit_signal("doTransition")
	$AudioStreamPlayer.play()
