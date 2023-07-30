extends Control

var dialog = [
	#'Congratulation!! You have won my game!',
	'You are chosen to play as the main character in my game.',
	'This game is simple. All you have to do is play the game that I invented.',
	'If not, your dearest darling is in my hand.',
	'You know what I meant, right?',
	'You are a clever retired cop. So, decide what you are gonna do.'
]

var dialog_index = 0
var finished = false

func _ready():
	load_dialog()
	
	
func _process(_delta):
		
	#if $AudioStreamPlayer.playing ==false:
	#$AudioStreamPlayer.play()
	#pass

	$Indicator.visible = finished
	if Input.is_action_just_pressed("ui_accept"):
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
		
	dialog_index += 1


func _on_Tween_tween_completed(_object, _key):
	finished = true
	
	if 	dialog_index == 5:
		SceneTransition.change_scene("res://MainMenu.tscn")

