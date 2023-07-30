extends Control
#onready var options =$AudioOptions
#onready var audio = $Audio
func _ready():
	show_and_hide($AudioOptions, $Audio)
	
func show_and_hide(first, second):
	first.show()
	second.hide()

func _on_Audio_pressed():
	show_and_hide($Audio,$AudioOptions)
	
	

func _on_BackFromOptions_pressed():
	SceneTransition.change_scene("res://MainMenu.tscn")


func _on_Master_value_changed(value: float):
	volume(0, value)
	
func volume(bus_index, value):
	AudioServer.set_bus_volume_db(bus_index, value)
	

func _on_Music_value_changed(value: float):
	volume(1, value)

func _on_SoundFX_value_changed(value: float):
	volume(2, value)


func _on_BackFromAudio_pressed():
	show_and_hide($AudioOptions, $Audio)
