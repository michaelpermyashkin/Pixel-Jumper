#StartMenu.gd
extends Control

func _ready():
	GameMusic.play()

func _on_Start_pressed():
	Global.resetGlobal()
	Global.set_scene()

func _on_Quit_pressed():
	get_tree().quit()
