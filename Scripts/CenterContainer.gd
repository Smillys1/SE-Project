extends CenterContainer

func _process(delta):
	
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://Scenes/MainMenu.tscn")
		queue_free()
