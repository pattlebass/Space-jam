extends RigidBody2D

var speed = 100
var turning_speed = 200
var thrust = Vector2()
var rotation_direction = 0

func _physics_process(delta):
	movement()

func movement():
	if Input.is_action_pressed("up"):
		thrust = Vector2(speed, 0)
	else:
		thrust = Vector2()
	if Input.is_action_pressed("left"):
		rotation_direction = -1
	elif Input.is_action_pressed("right"):
		rotation_direction = 1
	else:
		rotation_direction = 0
func _integrate_forces(state):
	set_applied_force(thrust.rotated(rotation))
	set_applied_torque(rotation_direction * turning_speed)