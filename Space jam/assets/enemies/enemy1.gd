extends KinematicBody2D

onready var player = get_parent().get_node("player")
var speed = 20
var damage = 1

func _physics_process(_delta):
	look_at(player.position)
	move_and_slide(Vector2(1, 0).rotated(rotation) * speed)

func _on_Area2D_body_entered(body):
	if body == self:
		return
	elif body == player:
		body.hp -= damage
	queue_free()
