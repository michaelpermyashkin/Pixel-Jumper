extends Node
const MAX_HEALTH = 10
var points = 0 #player begins with 0 points and accumulates points by collecting coins
var lives = 5 #player starts with 3 lives
var level = 1 #holds the level number, starts at 1 and is incremented by 1
var key_obtained = false #set to false on game start
var health = 10
var lastCoinCount = 0

func set_scene():
	#each scene the player must get key to unlock portal
	key_obtained = false #0 == false && 1 == true
	health = MAX_HEALTH
	lastCoinCount = Global.points #if player dies and level resets, coin count resets to previous start count
	
	if lives > 0:
		if level == 1:
			get_tree().change_scene("res://Scenes/World1.tscn")
			
		if level == 2:
			get_tree().change_scene("res://Scenes/World2.tscn")
			
		if level == 3:
			get_tree().change_scene("res://Scenes/World3.tscn")
			
		if level == 4:
			get_tree().change_scene("res://Scenes/World4.tscn")
		
		if level == 5:
			get_tree().change_scene("res://Scenes/World5.tscn")
		
		if level == 6:
			get_tree().change_scene("res://Scenes/World6.tscn")
		
		if level == 7:
			get_tree().change_scene("res://Scenes/World7.tscn")
		
		if level == 8:
			get_tree().change_scene("res://Scenes/World8.tscn")
		
		if level == 9:
			get_tree().change_scene("res://Scenes/World9.tscn")
		
		if level == 10:
			get_tree().change_scene("res://Scenes/World10.tscn")
			
		if level == 11:
			get_tree().change_scene("res://Scenes/World11.tscn")
			
		if level == 12:
			get_tree().change_scene("res://Scenes/World12.tscn")

	else:
		get_tree().change_scene("res://GameOverMenu.tscn")
		

func resetGlobal():
	points = 0 #player begins with 0 points and accumulates points by collecting coins
	lives = 5 #player starts with 3 lives
	level = 1 #holds the level number, starts at 1 and is incremented by 1
	lastCoinCount = 0
	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
