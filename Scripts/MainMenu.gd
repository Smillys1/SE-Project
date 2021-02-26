extends MarginContainer

const first_scene = preload("res://Scenes/World.tscn")
const second_scene = preload("res://Scenes/Credits.tscn")
onready var selector_one = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/Arrow
onready var selector_two = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer5/HBoxContainer/Arrow
onready var selector_three = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/Arrow
onready var selector_four = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer3/HBoxContainer/Arrow
onready var selector_five = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer4/HBoxContainer/Arrow

var current_selection = 0

func _ready():
	set_current_selection(0)

func _process(delta):

	if Input.is_action_just_pressed("ui_down"):
		print(current_selection)
		current_selection += 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_up"):
		print(current_selection)
		current_selection -= 1
		set_current_selection(current_selection)
	
	if(current_selection > 4):
		current_selection = 0
		set_current_selection(current_selection)
		
	if(current_selection < 0):
		current_selection = 4
		set_current_selection(current_selection)
		
	elif Input.is_action_just_pressed("ui_accept"):
		handle_selection(current_selection)
func handle_selection(_current_selection):
	if _current_selection == 0:
		get_parent().add_child(first_scene.instance())
		queue_free()
	elif _current_selection == 1:
		print("options hoe")
	elif _current_selection == 2:
		print("big continue")
	elif _current_selection == 3:
		get_tree().change_scene("res://Scenes/Credits.tscn")
	elif _current_selection == 4:
		print("Exit")
		get_tree().quit()
func set_current_selection(_current_selection):
	selector_one.text = ""
	selector_two.text = ""
	selector_three.text = ""
	selector_four.text = ""
	selector_five.text = ""
	
	if _current_selection == 0: # "New Game"
		selector_one.text = ">"
	elif _current_selection == 1: # "Continue"
		selector_two.text = ">"
	elif _current_selection == 2: # "Settings"
		selector_three.text = ">"
	elif _current_selection == 3: # "Credits"
		selector_four.text = ">"
	elif _current_selection == 4: # "Exit"
		selector_five.text = ">"

