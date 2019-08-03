extends "res://assets/enemies/enemy1.gd"

export (PackedScene) var bullet_scene

func _ready():
	$Timer.start(rand_range(1, 2))
	randomize()
	speed = 30
	damage = 1

func _on_Timer_timeout():
	if global_position.distance_to(player.global_position) <= 150:
		var bullet = bullet_scene.instance()
		get_parent().add_child(bullet)
		bullet.position = global_position
		bullet.rotation = rotation
		bullet.damage = damage
		bullet.parent_type = "enemy"
	$Timer.start(rand_range(1, 2))