extends Area2D
var can_interact = false
const DIALOG = preload("res://LadyDialogBox.tscn")

#enum{
#	IDLE,
#	DEATH
#}
#var state = IDLE

#func _physics_process(_delta):
#	match state:
#		IDLE:
#			idle_state()
#		DEATH:
#			death_state()

#func idle_state():
#	$AnimatedSprite.play("idle")
		
#func death_state():
#	$AnimatedSprite.play("death")
	
func _on_Lady_body_entered(body):
	if body.name == "Player":
		$Label.visible = true
		can_interact = true

func _on_Lady_body_exited(body):
	if body.name == "Player":
		$Label.visible = false
		can_interact = false
	

	
func _input(_event):
	if Input.is_key_pressed(KEY_E) and can_interact == true:
		$Label.visible = false
		var dialog = DIALOG.instance()
		dialog.rect_position = self.global_position
		get_parent().add_child(dialog)


#func _process(_delta):
#	if Input.is_action_just_pressed("attack"):
		#queue_free()			
#		var deathAnimation = load("res://Death.tscn")
#		var Death = deathAnimation.instance()
#		var world = get_tree().current_scene
#		world.add_child(Death)
#		Death.global_position = global_position
#		queue_free()	
		
func create_death_Animation():
	var deathAnimation = load("res://Death.tscn")
	var Death = deathAnimation.instance()
	var world = get_tree().current_scene
	world.add_child(Death)
	Death.global_position = global_position	

	
#func _on_AnimatedSprite_tree_exited() -> void:
#		SceneTransition.change_scene("res://EndDialog.tscn")

func _on_HurtBox_area_entered(_area):
	create_death_Animation()
	queue_free()
	SceneTransition.change_scene("res://TaskFinished.tscn")
