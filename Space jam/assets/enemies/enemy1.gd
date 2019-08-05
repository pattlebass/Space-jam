extends KinematicBody2D

onready var player = get_parent().get_node("player")
onready var game = get_parent()
var speed = 20
var damage = 1
var hp = 2
var type = "enemy"
var fov = 200
var sides = 4

func _physics_process(_delta):
	if game.over:
		destroy()
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
	print(sides)
	var particle_scene = preload("res://assets/particles.tscn")
	var particle = particle_scene.instance()
	get_parent().add_child(particle)
	particle.global_position = position
	particle.modulate = $Sprite.modulate
	particle.amount = sides
	game.enemies -= 1
	queue_free()
