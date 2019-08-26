#World complete

extends Area2D

#export(String, FILE, "*.tscn") var world_scene

func _physics_process(delta):
	var bodies = get_overlapping_bodies()

	for body in bodies:
		if body.name == "Player" && Global.key_obtained == true:
			Global.level += 1
			Global.set_scene()

