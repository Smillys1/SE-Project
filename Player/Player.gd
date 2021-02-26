extends KinematicBody2D

#const menu_scene = preload("res://Scenes/In_game_menu.tscn")

const MAX_SPEED = 80 # Max Speed Constant
const ACCELERATION = 500 # Acceleration Rate
const FRICTION = 500 # Friction rate

var velocity = Vector2.ZERO #  Vector( 0 , 0 , 0 )

#Movement
#Movement is based on a grid from zero; right is (1,0), left is (-1,0), up is (0,1),down is (0,-1)

onready var animation_player1 = $MainPlayerAnims
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
var pause_flag = 0 # 0 is unpaused, 1 is paused

func _physics_process(delta): # Delta runs off of time to process frame, 60 fps -> delta = 1/60


	if Input.is_action_just_pressed("ui_cancel"):
		if pause_flag == 0:
			pause_flag = 1
			get_tree().paused = true
			get_tree().change_scene("res://Scenes/In_game_menu.tscn")
			print("Game Paused!")
	
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized() # imagine right as "1,0". If input is "3,0" it will make it "1,0"

	if input_vector != Vector2.ZERO:
		
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Walk/blend_position", input_vector)
		animationState.travel("Walk")


		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = move_and_slide(velocity) # multiply velocity times delta to "keep speed" regardless of fps

	

