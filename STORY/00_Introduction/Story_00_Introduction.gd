extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var timer
var textIndice
var text = ["Once upon a time, a little girl, was eating with his father.",
			"[b]The father : [/b] Please, be a good girl, eat all your food",
			"[b]The little Girl : [/b] No, I don't want to eat all my food, it's monday",
			"[b]The father : [/b] Then ?",
			"[b]The little Girl : [/b] Then, you know !",
			"[b]The father : [/b] No, tell me.",
			"[b]The little Girl : [/b] It's Green Monday ! I don't eat meat or fish.",
			"[b]The father : [/b] Enough ! You bothered me",
			"[b]The little Girl : [/b] I bothered you but I won't eat meat today.",
			"[b]The father : [/b] It's not the kind of thing you say to your father, you're a little girl, you will do what I say",
			"[b]The little Girl : [/b] I'll never do what people wants if it's not what I want and, furthermore, if what they want is against me or my future",
			"[b]The father : [/b] Enough is enough ! I punish you ! Go in the cave, thinking of what you have said !",
			"[b]The little Girl : [/b] Thanks !"]
var textLines
var appearingText
var appearingTextPercent

# Called when the node enters the scene tree for the first time.
func _ready():
	textIndice = 0
	appearingTextPercent = 0.0
	textLines = text.size()
	appearingText = get_node("AppearingText")
	appearingText.bbcode_enabled = true
	appearingText.bbcode_text = text[textIndice]
	textIndice = textIndice+1
	timer = Timer.new()
	add_child(timer)
	
	timer.wait_time = 0.5
	timer.connect("timeout", self, "_timeout")
	timer.start()


func _timeout():
	appearingTextPercent = appearingTextPercent + 0.1
	if (appearingTextPercent < 1.0):
		appearingText.set_percent_visible(appearingTextPercent)
		timer.wait_time = 0.5
		timer.start()
	elif (appearingTextPercent == 1.0):
		appearingText.set_percent_visible(appearingTextPercent)
		timer.wait_time = 1.0
		timer.start()
	else:
		appearingTextPercent = 0
		if (textIndice < textLines):
			appearingText.set_percent_visible(appearingTextPercent)
			appearingText.bbcode_text = text[textIndice]
			textIndice = textIndice+1
			timer.wait_time = 0.2
			timer.start()
		else :
			var status = get_tree().change_scene("res://LEVELS/LEVEL01/LEVEL01.tscn")
			if ( status != OK ):
				print("Error : could not load LEVEL01 scene from 00_Introduction scene")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
