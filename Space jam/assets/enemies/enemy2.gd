extends "res://assets/enemies/enemy1.gd"

export (PackedScene) var bullet_scene

func _ready():
	$Timer.start(rand_range(2, 3))
	randomize()
	damage = 1

func _process(_delta):
	if global_position.distance_to(player.global_position) <= 50:
		speed = 0
	else:
		speed = 30

func _on_Timer_timeout():
	if global_position.distance_to(player.global_position) <= 150:
		var bullet = bullet_scene.instance()
		get_parent().add_child(bullet)
		bullet.position = global_position
		bullet.rotation = rotation
		bullet.damage = damage
		bullet.parent_type = "enemy"
	$Timer.start(rand_range(2, 3))