extends Area2D

#Player must get to key to unlock portal to next level

func _physics_process(delta):
	var bodies = get_overlapping_bodies()

	for body in bodies:
		if body.name == "Player":
			Global.key_obtained = true

func _on_Key_body_entered(body):
	if body.name == "Player":
		queue_free()
		KeySound.play()
