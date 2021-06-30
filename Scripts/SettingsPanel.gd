extends Popup

func _ready():
	SignalManager.connect("levelSceneTransitioned", self, "changeScene")


func _on_Restart_pressed():
	SignalManager.emit_signal("doDeathTransition")
	$Restart/AudioStreamPlayer.play()


func _on_Level_pressed():
	SignalManager.emit_signal("doLevelSceneTransition")
	$Level/AudioStreamPlayer.play()	

func changeScene():
	get_tree().change_scene("res://Scene/LevelSelection.tscn")
