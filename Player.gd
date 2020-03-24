extends KinematicBody2D

# initially the player points upward with no velocity
var velocity = Vector2(0, 0)
var player_direction = Vector2(0,-1)

const ACCELERATION = 2
const ROTATIONAL_ACCELERATION = 0.02

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	# linear acceleration forward / backward
	if Input.is_action_pressed("ui_up"):
		#print_debug("Up is pressed")
		velocity += ACCELERATION * player_direction
	if Input.is_action_pressed("ui_down"):
		#print_debug("Down is pressed")
		velocity -= ACCELERATION * player_direction
	
	# rotational velocity turning left / right
	if Input.is_action_pressed("ui_left"):
		#print_debug("Left is pressed")
		rotate(-ROTATIONAL_ACCELERATION)
		player_direction = player_direction.rotated(-ROTATIONAL_ACCELERATION).normalized()
	if Input.is_action_pressed("ui_right"):
		#print_debug("Right is pressed")
		rotate(ROTATIONAL_ACCELERATION)
		player_direction = player_direction.rotated(ROTATIONAL_ACCELERATION).normalized()
	
	# move
# warning-ignore:return_value_discarded
	move_and_slide(velocity)
