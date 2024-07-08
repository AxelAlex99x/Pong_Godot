extends Area2D
class_name Ball

var speed = 200
const directions = [Vector2.LEFT, Vector2.RIGHT]
var direction = directions.pick_random()

func _physics_process(delta):
	speed += delta * 2
	global_position += speed * direction * delta
