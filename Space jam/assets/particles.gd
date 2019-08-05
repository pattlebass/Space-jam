extends Particles2D

var life_time = 5

func _ready():
	emitting = true

func _process(delta):
	life_time -= delta
	if life_time <= 0:
		queue_free()