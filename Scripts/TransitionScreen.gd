extends CanvasLayer

func _ready():
	SignalManager.connect("doTransition", self, "transition")
	
func transition():
	$AnimationPlayer.play("fadeToBlack")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fadeToBlack":
		SignalManager.emit_signal("transitioned")
		$AnimationPlayer.play("fadeToNormal")
