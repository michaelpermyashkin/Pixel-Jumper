extends Area2D

func _on_Mushroom_body_entered(body):
	if body.name == "Player":
		Global.health += 1
		queue_free()
		MushroomSound.play()
