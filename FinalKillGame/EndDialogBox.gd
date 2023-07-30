extends Control

var dialog = [
	'Congratulation!! You have won my game!'
]

var dialog_index = 0
var finished = false

func _ready():
	$Success.play()
	load_dialog()
	
	
func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		$RichTextLabel.bbcode_text = dialog[dialog_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, 1,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
		$AudioStreamPlayer.play()
	else:
		queue_free()
		


func _on_Tween_tween_completed(_object, _key):
	finished = true
	


func _on_QuitButton_pressed() -> void:
	get_tree().quit()


func _on_RestartButton_pressed() -> void:
	SceneTransition.change_scene("res://MainMenu.tscn")
