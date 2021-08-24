extends Node2D

onready var particlePosition = $ParticlePosition
var particleScene = preload("res://Prefabs/RedParticles.tscn")

#func _on_Area2D_body_entered(body):
#	if "Player" or "PlayerMirror" in body.name:
#		$AudioStreamPlayer.play()
#		var particle = particleScene.instance()
#		add_child(particle)
#		particle.set_position(particlePosition.get_position())
#		SignalManager.emit_signal("doDeathTransition")
