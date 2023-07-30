extends Node2D



func _on_QuitButton_pressed():
	get_tree().quit()



func _on_RestartButton_pressed():
	SceneTransition.change_scene("res://MainMenu.tscn")
