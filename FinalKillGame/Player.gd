extends KinematicBody2D

export (int) var speed = 300

enum{
	MOVE,
	ATTACK
}

var state = MOVE
onready var HitBox = $HitBoxPivot/KnifeHitBox

func _physics_process(_delta):
	match state:
		MOVE:
			move_state()
		ATTACK:
			attack_state()

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
		move_and_slide(velocity * speed)

	if Input.is_action_just_pressed("attack"):
		state = ATTACK
		$hit.play()
	
			
func attack_state():
	$AnimationTree.get("parameters/playback").travel("Attack")

func attack_animation_finished():
	state = MOVE


