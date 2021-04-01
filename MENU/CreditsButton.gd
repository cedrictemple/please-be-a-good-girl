extends Button



# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed", self, "_button_pressed")

func _button_pressed():
	get_tree().change_scene("res://CREDITS/Credits.tscn")
