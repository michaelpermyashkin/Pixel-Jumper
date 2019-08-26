extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const ACCELERATION = 50
const MAX_SPEED = 200
const JUMP_HEIGHT = -605

var motion = Vector2()

func _ready():
	set_physics_process(true)
	set_process(true)
	displayLevelMessage()
	
func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	$DustParticlesRunningLeft.set_emitting(false)
	$DustParticlesRunningRight.set_emitting(false)

	updateCountDisplays()
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
		$Sprite.play("Run")
		$Sprite.flip_h = false
		
		if is_on_floor():
			$DustParticlesRunningRight.set_emitting(true)
		
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
		$Sprite.play("Run")
		$Sprite.flip_h = true
		
		if is_on_floor():
			$DustParticlesRunningLeft.set_emitting(true)
		
	else:
		$Sprite.play("Idle")
		friction = true
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT+ACCELERATION
			$DustParticlesRunningLeft.set_emitting(false)
			$DustParticlesRunningRight.set_emitting(false)
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		if motion.y < 0:
			$Sprite.play("Jump")
		else:
			$Sprite.play("Fall")
			if Global.health > 0 && motion.length() > 850:
				Global.health -= .35
				updateCountDisplays()
			if Global.health <= 0:
				die()
			
			if motion.length() > 1100:
				die()
			
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
	
	motion = move_and_slide(motion, UP)

func die():
	DieSound.play()
	Global.lives -= 1
	Global.points = Global.lastCoinCount
	Global.set_scene()

func updateCountDisplays():
	var No_Key_Image = load("res://Sprites/Platformer Art Complete Pack_0/Base pack/HUD/hud_keyYellow_disabled.png")
	var Key_Collected_Image = load("res://Sprites/Platformer Art Complete Pack_0/Base pack/HUD/hud_keyYellow.png")

	var LiveCountLabel = get_node("LifeCounter/Background/Number")
	LiveCountLabel.text = str(Global.lives)
	var CoinCountLabel = get_node("CoinCounter/Background/Number")
	CoinCountLabel.text = str(Global.points)
	get_node("Gauge").set_value(Global.health)

	if Global.key_obtained == true:
		get_node("KeyImage/Icon").set_texture(Key_Collected_Image)

func displayLevelMessage():
	var label = get_node("Label")
	label.text = str("LEVEL ",Global.level)

func _on_Timer_timeout():
	var label = get_node("Label")
	label.hide()

func _on_KillButton_pressed():
	die()
