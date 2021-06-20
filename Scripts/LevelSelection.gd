extends Control


func _ready():
	for levels in $ScrollContainer/GridContainer.get_children():
		levels.text = levels.name




func _on_1_pressed():
	print("preesed")
