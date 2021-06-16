extends Node2D

func _ready():
	SignalManager.connect("transitioned", self, "change_scene")

func _on_Button_pressed():
	SignalManager.emit_signal("doTransition")

func change_scene():
	get_tree().change_scene("res://Scene/Menu.tscn")

