extends Node2D

var over = false
var once = false
var enemies = 0
onready var player = $player
export (PackedScene) var enemy1_scene
export (PackedScene) var enemy2_scene
export (PackedScene) var enemy3_scene
var zoomed = false

func _ready():
	randomize()

func _process(_delta):
	$ui/enemies.text = str(enemies)
	if over:
		if Input.is_action_just_pressed("restart"):
			get_tree().change_scene("res://game.tscn")
		if once == false:
			$AnimationPlayer.play("game over")
			once = true
		return
	if Input.is_action_just_pressed("zoom"):
		zoomed = !zoomed
		if zoomed == false:
			$player/Camera2D.zoom = Vector2(6, 6)
		else:
			$player/Camera2D.zoom = Vector2(1, 1)
	if enemies < 70:
		var repeats = 70 - enemies
		for i in repeats:
			var x = rand_range(-1500, 1500)
			var y = rand_range(-1500, 1500)
			var spawn_position = Vector2(x, y)
			var distance_to_player = spawn_position.distance_to(player.global_position)
			if distance_to_player < 700 && distance_to_player > 150:
				enemies += 1
				var enemy_chosen
				var random_enemy = randi()%3
				if random_enemy == 0:
					enemy_chosen = enemy1_scene
				elif random_enemy == 1:
					enemy_chosen = enemy2_scene
				elif random_enemy == 2:
					enemy_chosen = enemy3_scene
				var enemy = enemy_chosen.instance()
				add_child(enemy)
				enemy.position = spawn_position