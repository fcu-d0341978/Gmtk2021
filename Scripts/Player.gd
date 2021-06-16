extends KinematicBody2D

var moveSpeed = 350
export(String, FILE) var nextScene = ""
onready var particlePosition = $ParticlePosition
var particleScene = preload("res://Prefabs/Particles.tscn")

func _process(delta):
	if Input.is_action_pressed("restart"):
		restartScene()

func _ready():
	SignalManager.connect("transitioned", self, "change_scene")
	SignalManager.connect("DeathTransitioned", self, "reloadScene")

func restartScene():
	SignalManager.emit_signal("doDeathTransition")
	

func reloadScene():
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
			if $AudioStreamPlayer != null:
				$AudioStreamPlayer.play()
			var particle = particleScene.instance()
			add_child(particle)
			particle.set_position(particlePosition.get_position())
			SignalManager.emit_signal("doTransition")

func change_scene():
	get_tree().change_scene(nextScene)
