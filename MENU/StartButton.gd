extends Button



# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed", self, "_button_pressed")

func _button_pressed():
	print("MENU BUTTON LEVEL 1 PRESSED")
	get_tree().change_scene("res://LEVELS/LEVEL01/LEVEL01.tscn")
