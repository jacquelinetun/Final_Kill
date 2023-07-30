extends Node2D
onready var animatedSprite = $AnimatedSprite

func _ready():
	animatedSprite.play("death")
	

func _on_AnimatedSprite_animation_finished():
	$AudioStreamPlayer.play()
	queue_free()
