extends KinematicBody2D

var moveSpeed = 500
export(String, FILE) var nextScene = ""

func _process(delta):
	if Input.is_action_pressed("restart"):
		get_tree().reload_current_scene()

func _physics_process(delta):
	var motion = Vector2()
	
	if Input.is_action_pressed("up"):
		motion.y -= 1
	
	if Input.is_action_pressed("down"):
		motion.y += 1
		
	if Input.is_action_pressed("right"):
		motion.x += 1
		
	if Input.is_action_pressed("left"):
		motion.x -= 1
	
	motion = motion.normalized()
	motion = move_and_slide(motion * moveSpeed)


func _on_Area2D_body_entered(body):
	if "PlayerMirror" in body.name:
		if nextScene == "":
			print("Enter next scene path")
		else:
			get_tree().change_scene(nextScene)

