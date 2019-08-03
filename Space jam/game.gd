extends Node2D

var enemies = 0
export (PackedScene) var enemy1_scene
export (PackedScene) var enemy2_scene

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	for i in 300:
		enemies += 1
		var enemy1 = enemy1_scene.instance()
		add_child(enemy1)
		enemy1.position = Vector2(rand_range(-1500, 1500), rand_range(-1500, 1500))
	for i in 300:
		enemies += 1
		var enemy2 = enemy2_scene.instance()
		add_child(enemy2)
		enemy2.position = Vector2(rand_range(-1500, 1500), rand_range(-1500, 1500))
