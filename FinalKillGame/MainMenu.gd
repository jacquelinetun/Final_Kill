extends Control
onready var menu =$Menu

#func _process(_delta):
#	if Input.is_action_just_pressed("ui_cancel"):
#		toggle()
		

func _ready():
	$Menu/StartButton.grab_focus()
	
#func toggle():
	#visible = !visible
#	get_tree().paused = visible

func _on_StartButton_pressed():
#	toggle()
	SceneTransition.change_scene("res://LadyAssignedTask.tscn")

func _on_OptionsButton_pressed():
	SceneTransition.change_scene("res://Options.tscn")
	
	
func _on_QuitButton_pressed():
	get_tree().quit()


