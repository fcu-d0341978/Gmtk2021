extends Node2D

export(int) var linkCode: int = 0
signal doorOpen
onready var actionables_container: Node2D = get_parent().get_parent().get_node("Doors")
var normalColor = '#ade8f4'
var pressedColor = '#c8ebf2'

func _on_Area2D_body_entered(body):
	if "Player" or "PlayerMirror" in body.name:
		$AudioStreamPlayer.play()
		$Area2D/Sprite.modulate = Color(pressedColor)
		emit_signal("doorOpen")


func _on_Area2D_body_exited(body):
	if "Player" or "PlayerMirror" in body.name:
		$Area2D/Sprite.modulate = Color(normalColor)


func _ready():
	if linkCode != 0:
		for actionable in actionables_container.get_children():
			if actionable.linkCode == linkCode:
				connect("doorOpen", actionable, "_change_state")
