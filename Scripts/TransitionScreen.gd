extends CanvasLayer

onready var audioPlayer = $AudioStreamPlayer

func _ready():
	SignalManager.connect("doTransition", self, "transition")
	SignalManager.connect("doDeathTransition", self, "deathTransition")
	SignalManager.connect("doLevelSceneTransition", self, "levelSceneTransition")

func transition():
	$AnimationPlayer.play("fadeToBlack")

func deathTransition():
	$AnimationPlayer.play("fadeToRed")	

func levelSceneTransition():
	$AnimationPlayer.play("fadeToBlue")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fadeToBlack":
		SignalManager.emit_signal("transitioned")
		$AnimationPlayer.play("fadeToNormal")
		
	if anim_name == "fadeToRed":
		SignalManager.emit_signal("DeathTransitioned")
		$AnimationPlayer.play("fadeToNormalRed")
		
	if anim_name == "fadeToBlue":
		SignalManager.emit_signal("levelSceneTransitioned")
		$AnimationPlayer.play("fadeToNormalBlue")


func _on_AudioStreamPlayer_finished():
	audioPlayer.play()
