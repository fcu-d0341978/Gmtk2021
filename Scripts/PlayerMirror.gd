extends KinematicBody2D

var moveSpeed = 350
var nextScene = ""
onready var particlePosition = $ParticlePosition
var particleScene = preload("res://Prefabs/Particles.tscn")
var redParticleScene = preload("res://Prefabs/RedParticles.tscn")
export(bool) var isReverse: bool = false
var direction = 1

func _process(delta):
	if Input.is_action_pressed("restart"):
		restartScene()

func _ready():
	nextScene = "res://Scene/Level" + String(int(get_parent().name) + 1) + ".tscn"
	SignalManager.connect("transitioned", self, "change_scene")
	SignalManager.connect("DeathTransitioned", self, "reloadScene")
	if(isReverse && name == "PlayerMirror"):
		direction = -1
		$Sprite.modulate = Color('#6D7CE1')

func restartScene():
	SignalManager.emit_signal("doDeathTransition")
	

func reloadScene():
	get_tree().reload_current_scene()

func _physics_process(delta):
	var motion = Vector2()
#
	if Input.is_action_pressed("up"):
		motion.y -= direction

	if Input.is_action_pressed("down"):
		motion.y += direction

	if Input.is_action_pressed("right"):
		motion.x += direction

	if Input.is_action_pressed("left"):
		motion.x -= direction

	motion = motion.normalized()
	motion = move_and_slide(motion * moveSpeed)


func _on_Area2D_area_entered(area):
	print(area.name)
	if "MovingBlockArea" in area.name:
		print(area.name)
		var particle = redParticleScene.instance()
		add_child(particle)
		particle.set_position(particlePosition.get_position())
		SignalManager.emit_signal("doDeathTransition")
	
	if "SpikeArea" in area.name:
		print(area.name)
		var particle = redParticleScene.instance()
		add_child(particle)
		particle.set_position(particlePosition.get_position())
		SignalManager.emit_signal("doDeathTransition")
