extends Node2D

func _ready():
	
	$AnimationPlayer.play("Fade in")
	yield(get_tree().create_timer(6),"timeout")
	$AnimationPlayer.play("Fade out")
	yield(get_tree().create_timer(3),"timeout")
	SceneTransition.change_scene("res://CreatorsNote.tscn")
