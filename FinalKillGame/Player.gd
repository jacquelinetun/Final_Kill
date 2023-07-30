extends KinematicBody2D

export (int) var speed = 300

enum{
	MOVE,
	ATTACK,
	SHOOT
}

var state = MOVE
onready var HitBox = $HitBoxPivot/KnifeHitBox

func _physics_process(_delta):
	match state:
		MOVE:
			move_state()
		ATTACK:
			attack_state()
		SHOOT:
			shoot_state()

func move_state():
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("right"):
		velocity.x += 1.0
	if Input.is_action_pressed("left"):
		velocity.x -= 1.0	
	if Input.is_action_pressed("down"):
		velocity.y += 1.0
	if Input.is_action_pressed("up"):
		velocity.y -= 1.0	
	velocity = velocity.normalized()
	
	
	
	if velocity == Vector2.ZERO:
		$AnimationTree.get("parameters/playback").travel("Idle")
	else:
		$AnimationTree.get("parameters/playback").travel("Walk")
		$AnimationTree.set("parameters/Idle/blend_position", velocity)
		$AnimationTree.set("parameters/Walk/blend_position", velocity)
		$AnimationTree.set("parameters/Attack/blend_position", velocity)
		$AnimationTree.set("parameters/Shoot/blend_position", velocity)
		move_and_slide(velocity * speed)

	if Input.is_action_just_pressed("attack"):
		state = ATTACK
		$hit.play()
	
	if Input.is_action_just_pressed("shoot"):
		state = SHOOT
		$shootfx.play()
			
func attack_state():
	$AnimationTree.get("parameters/playback").travel("Attack")

func attack_animation_finished():
	state = MOVE

func shoot_state():
	$AnimationTree.get("parameters/playback").travel("Shoot")

	
func shoot_animation_finished():
	state = MOVE



		
#func get_save_stats():
#	return {
#		'filename' : get_filename(),
#		'parent' : get_parent().get_path(),
#		'x_pos' : global_transform.origin.x,
#		'y_pos' : global_transform.origin.y
#	}

#func load_save_stats(stats):
#	global_transform.origin = Vector2(stats.x_pos,stats.y_pos)
	
	
