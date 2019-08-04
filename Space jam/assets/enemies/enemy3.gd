extends "res://assets/enemies/enemy1.gd"

export (PackedScene) var bullet_scene

func _process(_delta):
	rotation_degrees = 0
	if global_position.distance_to(player.global_position) <= 50:
		speed = 0
		for i in 5:
			var bullet = bullet_scene.instance()
			get_parent().add_child(bullet)
			bullet.position = get_node(str(i)).global_position
			bullet.rotation = get_node(str(i)).rotation
			bullet.damage = damage
			bullet.parent_type = "enemy"
		queue_free()
	else:
		speed = 20