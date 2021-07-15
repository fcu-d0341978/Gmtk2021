extends Node

var saveFileName = "user://save_game.save"

func saveGame():
	var saveFile = File.new()
	saveFile.open(saveFileName, File.WRITE)
	var savedNodes = get_tree().get_nodes_in_group("Saved")
	
	
