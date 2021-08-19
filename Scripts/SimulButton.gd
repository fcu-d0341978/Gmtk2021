extends Node2D

var triggered = false
onready var parent: Node2D = get_parent()
onready var actionables_container: Node2D = get_parent().get_parent().get_node("Doors")
export(int) var linkCode: int = 0
signal doorOpen

var normalColor = '#560bad'
var normalColor2 = '#7209b7'
var normalColor3 = '#b5179e'
var pressedColor = '#566ee0'
var thisColor = ''

func _ready():
	if linkCode != 0:
		for actionable in actionables_container.get_children():
			if actionable.linkCode == linkCode:
				connect("doorOpen", actionable, "_change_state")
	
	if(linkCode == 1):
		thisColor = normalColor
	if(linkCode == 2):
		thisColor = normalColor2
	if(linkCode == 3):
		thisColor = normalColor3
	
	$Area2D/Sprite.modulate = Color(thisColor)

func _on_Area2D_body_entered(body):
	if "Player" or "PlayerMirror" in body.name:
		$AudioStreamPlayer.play()
		$Area2D/Sprite.modulate = Color(pressedColor)
		triggered = true
		check_condition()


func _on_Area2D_body_exited(body):
	if "Player" or "PlayerMirror" in body.name:
		$Area2D/Sprite.modulate = Color(thisColor)
		triggered = false

func check_condition():
	var triggerCount = 0
	for simulButton in parent.get_children():
		if simulButton.triggered:
			triggerCount += 1
	
	if triggerCount == 2:
		emit_signal("doorOpen")
