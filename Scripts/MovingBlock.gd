extends Node2D

const BLOCK_SIZE = 32

export var move_to = Vector2.RIGHT * 2
export var speed = 3.0
export var idle_duration = 0.5

onready var block = $KinematicBody2D
onready var tween = $Tween


func _ready():
	move_to = move_to * BLOCK_SIZE
	init_tween()

func init_tween():
	var duration = move_to.length() / float(speed * BLOCK_SIZE)
	tween.interpolate_property(block, "position", Vector2.ZERO, move_to, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, idle_duration)
	tween.interpolate_property(block, "position", move_to, Vector2.ZERO, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, duration + idle_duration * 2)
	tween.start()


#func _on_Area2D_area_entered(area):
#	if "Player" or "PlayerMirror" in area.name:
#		SignalManager.emit_signal("doDeathTransition")
