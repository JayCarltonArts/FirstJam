extends CharacterBody2D

const accel =1500
const friction =600
const speed =100

var input = Vector2.ZERO

func _physics_process(delta):
	player_movement(delta)


func get_input():
	input.x =int(Input.is_action_pressed("ui_right"))- int(Input.is_action_pressed("ui_left"))
	input.y =int(Input.is_action_pressed("ui_down"))- int(Input.is_action_pressed("ui_up"))
	return input.normalized()
	
func player_movement(delta):
	input = get_input()
	
	if input != Vector2.ZERO:
		#if velocity.length() > (friction * delta):
			#velocity -= velocity.normalized() * (friction*delta)
		#else:
			#velocity = Vector2.ZERO
	#else:
		velocity+=(input * speed)
		velocity = velocity.limit_length(speed)
		
	else:
		velocity = input
		
		
		
	move_and_slide()
