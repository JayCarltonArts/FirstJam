extends CharacterBody2D


const speed =60
var current_dir ="none"
var canPick = true

var completed_goals= 3

func _physics_process(delta):
	player_movement(delta)


func _ready():
	$AnimatedSprite2D.play("front_idle")

func player_movement(_delta):
	
#personal movement
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_animation(1)
		velocity.x = speed
		velocity.y =0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_animation(1)
		velocity.x = -speed
		velocity.y =0
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_animation(1)
		velocity.x = 0
		velocity.y =-speed
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_animation(1)
		velocity.x = 0
		velocity.y =speed
	else:
		velocity.x = 0
		velocity.y =0
		play_animation(0)
		
		
	move_and_slide()
	
func play_animation(movement):
	var dir = current_dir
	var animation = $AnimatedSprite2D
	
	if dir== "right":
		animation.flip_h=false
		if movement ==1:
			animation.play("side_walk")
		elif movement ==0:
			animation.play("side_idle")
	elif dir== "left":
		animation.flip_h=true
		if movement ==1:
			animation.play("side_walk")
		elif movement ==0:
			animation.play("side_idle")
	elif dir== "up":
		animation.flip_h=true
		if movement ==1:
			animation.play("back_walk")
		elif movement ==0:
			if Input.is_action_pressed("interact"):
				animation.play("back_interact")
				
			else:
				animation.play("back_idle")
			
	elif dir== "down":
		animation.flip_h=true
		if movement ==1:
			animation.play("front_walk")
		elif movement ==0:
			animation.play("front_idle")
		
