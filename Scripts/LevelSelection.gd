extends Control


func _ready():
	for levels in $ScrollContainer/GridContainer.get_children():
		levels.text = levels.name
	
	for i in range($ScrollContainer/GridContainer.get_child_count()):
		SignalManager.levels.append(i + 1)
	
	for level in $ScrollContainer/GridContainer.get_children():
		if str2var(level.name) in range(SignalManager.unlockedLevels + 1):
			level.disabled = false
			level.connect('pressed', self, 'doTransition')
			level.connect("pressed", self, 'playSfx')
			SignalManager.connect("transitioned", self, "changeLevel", [level.name])
		else:
			level.disabled = true
	
	
	
func doTransition():
	SignalManager.emit_signal("doTransition")

func changeLevel(levelNum):
	get_tree().change_scene("res://Scene/Level" + levelNum + ".tscn")

func playSfx():
	$AudioStreamPlayer.play()
