extends RichTextLabel

var labelText = ["LEVEL "]
var page = 0

func _ready():
	set_bbcode(labelText[page])
	set_visible_characters(0)


func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
