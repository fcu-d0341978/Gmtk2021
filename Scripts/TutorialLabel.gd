extends Label

onready var animation = $AnimationPlayer


func _on_Timer_timeout():
	animation.play("fadeIn")

func _on_Timer2_timeout():
	animation.play("fadeOut")
