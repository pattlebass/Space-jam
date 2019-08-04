extends KinematicBody2D

onready var player = get_parent().get_node("player")
onready var game = get_parent()
var speed = 20
var damage = 1
var hp = 2
var type = "enemy"
var fov = 200

func _physics_process(_delta):
	if global_position.distance_to(player.global_position) <= fov:
		look_at(player.position)
		move_and_slide(Vector2(1, 0).rotated(rotation) * speed)
	if hp <= 0:
		destroy()
	if global_position.distance_to(player.global_position) > 1000:
		destroy()
func _on_Area2D_body_entered(body):
	if body == self:
		return
	elif body == player:
		body.hp -= damage
	destroy()
	
func destroy():
	game.enemies -= 1
	queue_free()
