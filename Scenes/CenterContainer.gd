extends CenterContainer

const back_to_game = "res://Scenes/World.tscn"

onready var selector_one = $CenterContainer/VBoxContainer/CenterContainer/HBoxContainer/Arrow
onready var selector_two = $CenterContainer/VBoxContainer/CenterContainer4/HBoxContainer/Arrow
onready var selector_three = $CenterContainer/VBoxContainer/CenterContainer3/HBoxContainer/Arrow
onready var selector_four = $CenterContainer/VBoxContainer/CenterContainer5/HBoxContainer/Arrow

var selector_count = 0

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
	
		print("aaa")
		#_handle_selections(selector_count)
#func _handle_selections(selector_count):
	#if selector_count == 0:
	#	get_tree().switch_scene(back_to_game)
