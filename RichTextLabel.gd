extends Label

var labelText = ["LEVEL "]
var page = 0

func _ready():
	set_bbcode(labelText[page])
	set_visible_characters(0)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
