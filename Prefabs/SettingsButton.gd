extends TextureButton


func _on_TextureButton_pressed():
	$"/root/SettingsPanel".popup_centered()
