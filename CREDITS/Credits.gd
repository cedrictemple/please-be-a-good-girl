extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var timer
var CreditsText
var LineToScroll

# Called when the node enters the scene tree for the first time.
func _ready():
	CreditsText = get_node("CreditsText")
	timer = Timer.new()
	add_child(timer)
	LineToScroll = 0
	
	timer.wait_time = 0.02
	timer.connect("timeout", self, "_timeout")
	timer.start()

func _timeout():
	var myPosition = CreditsText.get_position()
	myPosition = myPosition + Vector2(0,-1)
	#CreditsText.scroll_to_line(LineToScroll)
	CreditsText.set_position(myPosition,false)
	timer.start()
