extends Node2D

const IDLE_DURATION = 1

export var move_to = Vector2.RIGHT * 192
export var speed = 3.0

onready var block = $KinematicBody2D
onready var tween = $Tween

func _ready():
	init_tween()

func init_tween():
	var duration = move_to.length() / float(speed * 32)
	tween.interpolate_property(block, "position", Vector2.ZERO, move_to, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, IDLE_DURATION)
	tween.interpolate_property(block, "position", move_to, Vector2.ZERO, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, duration + IDLE_DURATION * 2)
	tween.start()
