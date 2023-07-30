extends KinematicBody2D

#const speed = 30
var current_state = IDLE
var dir = Vector2.RIGHT
#var start_pos

enum {
	IDLE,
	NEW_DIR
}

func _ready():
	randomize()
#	start_pos = position
	
func _process(_delta):
	match current_state:
		IDLE:
			pass
		NEW_DIR:
			dir = choose([Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT])

func choose(array):
	array.shuffle()
	return array.front()


func _on_Timer_timeout():
	$Timer.wait_time = choose([1, 2])
	current_state = choose([IDLE, NEW_DIR])
