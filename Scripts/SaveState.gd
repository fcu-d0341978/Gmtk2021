extends Node

var saveFileName = "user://save_game.save"

func saveGame(levelReached):
	var saveFile = File.new()
	var error = saveFile.open(saveFileName, File.WRITE)
	if error == OK:
		saveFile.store_var(levelReached)
		saveFile.close()
		print("Saved" + String(levelReached))

func loadGame():
	var level = 0
	var saveFile = File.new()
	if saveFile.file_exists(saveFileName):
		var error = saveFile.open(saveFileName, File.READ)
		if error == OK:
			level = saveFile.get_var()
			saveFile.close()
			print("Loaded" + String(level))
	return level
