extends Control
var running = false
func _ready():
	$DialogueBox.start()


func _on_DialogueBox_dialogue_proceeded() -> void:
	$Typing.play()

#func _process(_delta) -> void:
#	if $Bg.playing == false:
#		$Bg.play()
#	pass

func _on_DialogueBox_dialogue_ended():
	SceneTransition.change_scene("res://World.tscn")

