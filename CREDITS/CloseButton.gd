extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	var status = connect("pressed", self, "_button_pressed")
	if ( status != OK ):
		print("Error : could not attach callback in credit scene to close button")

func _button_pressed():
	var status = get_tree().change_scene("res://MENU.tscn")
	if ( status != OK ):
		print("Error : could not load menu scene from credits scene")

