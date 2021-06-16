extends CanvasLayer

onready var audioPlayer = $AudioStreamPlayer

func _ready():
	SignalManager.connect("doTransition", self, "transition")
	SignalManager.connect("doDeathTransition", self, "deathTransition")

func transition():
	$AnimationPlayer.play("fadeToBlack")

func deathTransition():
	$AnimationPlayer.play("fadeToRed")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fadeToBlack":
		SignalManager.emit_signal("transitioned")
		$AnimationPlayer.play("fadeToNormal")
		
	if anim_name == "fadeToRed":
		SignalManager.emit_signal("DeathTransitioned")
		$AnimationPlayer.play("fadeToNormalRed")


func _on_AudioStreamPlayer_finished():
	audioPlayer.play()
