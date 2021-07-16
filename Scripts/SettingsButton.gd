extends TextureButton

func _on_TextureButton_pressed():
	SignalManager.emit_signal("doDeathTransition")
	$AudioStreamPlayer.play()
