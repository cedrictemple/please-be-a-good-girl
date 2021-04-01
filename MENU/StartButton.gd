extends Button



# Called when the node enters the scene tree for the first time.
func _ready():
	var status = connect("pressed", self, "_button_pressed")
	if ( status != OK ):
		print("Error : could not attach callback to start button in menu scene")

func _button_pressed():
	var status = get_tree().change_scene("res://LEVELS/LEVEL01/LEVEL01.tscn")
	if ( status != OK ):
		print("Error : could not load LEVEL01 scene from menu scene")
