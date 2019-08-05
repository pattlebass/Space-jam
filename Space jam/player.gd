extends RigidBody2D

var hp = 10
var speed = 200
var type = "player"
var damage = 1
onready var game = get_parent()
#var turning_speed = 200
var thrust = Vector2()
#var rotation_direction = 0
export (PackedScene) var bullet_scene
func _physics_process(delta):
	get_parent().get_node("ui/HP").text = str(hp)
	if hp <= 0:
		destroy()
	get_input()

func get_input():
	if Input.is_action_pressed("up"):
		thrust = Vector2(speed, 0)
	else:
		thrust = Vector2()
	if Input.is_action_pressed("shoot") && $Timer.is_stopped():
		$Timer.start()
		var bullet = bullet_scene.instance()
		game.add_child(bullet)
		bullet.position = $Position2D.global_position
		bullet.rotation = rotation
		bullet.parent_type = "player"
		bullet.damage = damage
		bullet.modulate = $Sprite.modulate

	#if Input.is_action_pressed("left"):
	#	rotation_direction = -1
	#elif Input.is_action_pressed("right"):
	#	rotation_direction = 1
	#else:
	#	rotation_direction = 0
	look_at(get_global_mouse_position())
func _integrate_forces(state):
	set_applied_force(thrust.rotated(rotation))
	#set_applied_torque(rotation_direction * turning_speed)
func destroy():
	var particle_scene = preload("res://assets/particles.tscn")
	var particle = particle_scene.instance()
	game.add_child(particle)
	particle.global_position = position
	particle.modulate = $Sprite.modulate
	game.over = true
	var camera_after_death = game.get_node("Camera2D")
	camera_after_death.current = true
	camera_after_death.global_position = position
	queue_free()