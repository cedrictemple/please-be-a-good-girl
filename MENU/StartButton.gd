extends Button



# Called when the node enters the scene tree for the first time.
func _ready():
	var status = connect("pressed", self, "_button_pressed")
	if ( status != OK ):
		print("Error : could not attach callback to start button in menu scene")

func _button_pressed():
	var status = get_tree().change_scene("res://STORY/00_Introduction/Story_00_Introduction.tscn")
	if ( status != OK ):
		print("Error : could not load 00_Introduction scene from menu scene")
