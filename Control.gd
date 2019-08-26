# Game over menu screen
extends Control

func _ready():
	get_node("CenterContainer/Score").text = str("SCORE:  ", Global.points)

func _on_Try_Again_pressed():
	Global.resetGlobal()
	Global.set_scene()
	
func _on_Main_Menu_pressed():
	Global.resetGlobal()
	get_tree().change_scene("res://Start Menu.tscn")
