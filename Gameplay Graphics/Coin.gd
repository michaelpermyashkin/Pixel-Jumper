extends Area2D

func _physics_process(delta):
	var bodies = get_overlapping_bodies()

	for body in bodies:
		if body.name == "Player":
			Global.points += 1
			
func _on_Coin_body_entered(body):
	if body.name == "Player":
		queue_free()
		CoinSound.play()
		
