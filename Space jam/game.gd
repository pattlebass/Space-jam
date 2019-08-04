extends Node2D

var enemies = 0
onready var player = $player
export (PackedScene) var enemy1_scene
export (PackedScene) var enemy2_scene

func _ready():
	randomize()

func _process(_delta):
	$ui/HP.text = str(player.hp)
	$ui/enemies.text = str(enemies)
	if enemies < 70:
		var repeats = 70 - enemies
		for i in repeats:
			var x = rand_range(-1500, 1500)
			var y = rand_range(-1500, 1500)
			var spawn_position = Vector2(x, y)
			var distance_to_player = spawn_position.distance_to(player.global_position)
			if distance_to_player < 700 && distance_to_player > 250:
				enemies += 1
				var enemy_chosen
				if randi()%2 == 1:
					enemy_chosen = enemy1_scene
				else:
					enemy_chosen = enemy2_scene
				var enemy = enemy_chosen.instance()
				add_child(enemy)
				enemy.position = spawn_position