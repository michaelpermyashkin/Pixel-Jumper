extends Area2D



func _on_SpikesUp_body_entered(body):
	if body.name == "Player":
		queue_free()
		Global.health -= 2
		SpikeHitSound.play()
