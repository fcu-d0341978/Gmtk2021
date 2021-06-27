extends Popup




func _on_Restart_pressed():
	SignalManager.emit_signal("doDeathTransition")


func _on_Level_pressed():
	get_tree().change_scene("res://Scene/LevelSelection.tscn")
