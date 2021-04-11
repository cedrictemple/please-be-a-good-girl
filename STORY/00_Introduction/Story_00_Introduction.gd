extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var timer


# Called when the node enters the scene tree for the first time.
func _ready():
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = 10.0
	timer.connect("timeout", self, "_timeout")
	timer.start()


func _timeout():
	var status = get_tree().change_scene("res://LEVELS/LEVEL01/LEVEL01.tscn")
	if ( status != OK ):
		print("Error : could not load LEVEL01 scene from 00_Introduction scene")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
