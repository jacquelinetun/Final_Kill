extends KinematicBody2D
export var ACCELERATION = 300
export var MAX_SPEED = 100
export var FRICTION = 200

#var lose = false
enum{
	IDLE,
	CHASE
}

var velocity = Vector2.ZERO

var knockback = Vector2.ZERO

var state = IDLE
onready var stats = $Stats
onready var playerDetectionZone = $PlayerDetectionZone

func _physics_process(delta: float) -> void:
	knockback = knockback.move_toward(Vector2.ZERO, FRICTION * delta)
	knockback = move_and_slide(knockback)
	
	match state:
		IDLE:
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
			seek_player()
		CHASE:
			var player = playerDetectionZone.player
			if player != null:
				var direction = (player.global_position - global_position).normalized()
				velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
	velocity = move_and_slide(velocity)
	
func seek_player():
	if playerDetectionZone.can_see_player():
		state = CHASE

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		var deathAnimation = load("res://Death.tscn")
		var Death = deathAnimation.instance()
		var world = get_tree().current_scene
		world.add_child(Death)
		Death.global_position = global_position
		queue_free()
			

func _on_HurtBox_area_entered(_area: Area2D) -> void:
	if Input.is_action_just_pressed("shoot"):
		queue_free()


func _on_PoliceArea2D_body_entered(body: Node) -> void:
	if body.name == "Player":
	#	if lose == true:
		SceneTransition.change_scene("res://GameOver.tscn")
	
  
