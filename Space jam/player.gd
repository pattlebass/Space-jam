extends RigidBody2D

var hp = 5
var speed = 200
var type = "player"
var damage = 1
#var turning_speed = 200
var thrust = Vector2()
#var rotation_direction = 0
export (PackedScene) var bullet_scene
func _physics_process(delta):
	movement()

func movement():
	if Input.is_action_pressed("up"):
		thrust = Vector2(speed, 0)
	else:
		thrust = Vector2()
	if Input.is_action_pressed("shoot") && $Timer.is_stopped():
		$Timer.start()
		var bullet = bullet_scene.instance()
		get_parent().add_child(bullet)
		bullet.position = $Position2D.global_position
		bullet.rotation = rotation
		bullet.parent_type = "player"
		bullet.damage = damage

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
