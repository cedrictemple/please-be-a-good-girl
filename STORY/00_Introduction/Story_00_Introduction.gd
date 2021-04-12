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
			"[b]The little Girl : [/b] It's Green Monday ! I don't eat meat or fish on Green Monday.",
			"[b]The father : [/b] Enough ! You're bothering me",
			"[b]The little Girl : [/b] I'm bothering you but I won't eat meat today.",
			"[b]The father : [/b] It's not the kind of thing you say to your father, you're a little girl, you will do what I say",
			"[b]The little Girl : [/b] I'll never do what people wants if it's not what I want and, furthermore, if what they want is against me or my future",
			"[b]The father : [/b] Enough is enough ! You're punished ! Go in the cave, thinking of what you have said !",
			"[b]The little Girl : [/b] Thanks !"]
var textLines
var appearingText
var appearingTextChars
var textLineLength

# Called when the node enters the scene tree for the first time.
func _ready():
	textIndice = 0
	appearingTextChars = 0
	textLines = text.size()
	appearingText = get_node("AppearingText")
	appearingText.set_visible_characters(appearingTextChars)
	appearingText.bbcode_enabled = true
	appearingText.bbcode_text = text[textIndice]
	textLineLength = appearingText.text.length()
	textIndice = textIndice+1
	timer = Timer.new()
	add_child(timer)
	
	timer.wait_time = 0.05
	timer.connect("timeout", self, "_timeout")
	timer.start()


func _timeout():
	appearingTextChars = appearingTextChars + 1
	if (appearingTextChars < textLineLength):
		appearingText.set_visible_characters(appearingTextChars)
		timer.wait_time = 0.05
		timer.start()
	elif (appearingTextChars == textLineLength):
		appearingText.set_visible_characters(appearingTextChars)
		timer.wait_time = 2.0
		timer.start()
	else:
		appearingTextChars = 0
		if (textIndice < textLines):
			appearingText.set_visible_characters(appearingTextChars)
			appearingText.bbcode_text = text[textIndice]
			textIndice = textIndice+1
			textLineLength = appearingText.text.length()
			timer.wait_time = 0.05
			timer.start()
		else :
			var status = get_tree().change_scene("res://LEVELS/LEVEL01/LEVEL01.tscn")
			if ( status != OK ):
				print("Error : could not load LEVEL01 scene from 00_Introduction scene")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
