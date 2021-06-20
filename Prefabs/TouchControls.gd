extends Node2D

func _on_TouchScreenButtonUp_pressed():
	print("Pressed")
	Input.action_press("up")

func _on_TouchScreenButtonDown_pressed():
	Input.action_press("down")


func _on_TouchScreenButtonRight_pressed():
	Input.action_press("right")


func _on_TouchScreenButtonLeft_pressed():
	Input.action_press("left")


func _on_TouchScreenButtonUp_released():
	Input.action_release("up")


func _on_TouchScreenButtonDown_released():
	Input.action_release("down")


func _on_TouchScreenButtonLeft_released():
	Input.action_release("left")


func _on_TouchScreenButtonRight_released():
	Input.action_release("right")
