extends KinematicBody2D

var speed = 250
var damage
var parent_type

func _physics_process(delta):
	move_and_collide(Vector2(1, 0).rotated(rotation) * speed * delta)

func _on_Timer_timeout():
	queue_free()

func _on_Area2D_body_entered(body):
	if body.is_in_group("wall"):
		queue_free()
	elif body.type != parent_type:
		body.hp -= damage
		modulate = body.get_node("Sprite").modulate
		$Particles2D.emitting = true
		$Area2D/CollisionShape2D.queue_free()
		$Sprite.queue_free()
		speed = 0