extends Node2D

export(int) var linkCode: int = 0
var isOpen: bool = false

onready var collisionShape: CollisionShape2D = get_node("StaticBody2D/CollisionShape2D")
onready var animationPlayer = $AnimationPlayer


func _ready():
	collisionShape.disabled = false

func _change_state():
	if !isOpen:
		isOpen = !isOpen
		animationPlayer.play("fadeOut")
		
	


func _on_AnimationPlayer_animation_finished(anim_name):
	get_parent().remove_child(self)
