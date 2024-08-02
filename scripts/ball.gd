extends Area2D
class_name Ball

var speed = 200
const directions = [Vector2.LEFT, Vector2.RIGHT]
var direction = directions.pick_random()

@onready var trail : Line2D = $Sprite2D/Line2D
@onready var timer = $Timer
var trail_length = 25
var show_trail = false

func _physics_process(delta):
	speed += delta * 2
	global_position += speed * direction * delta
	if show_trail:
		trail.add_point(global_position)
		if trail.get_point_count() > trail_length:
			trail.remove_point(0)
		if timer.time_left == 0:
			show_trail = false
			trail.clear_points()
		print(timer.time_left)

func on_collision():
	show_trail = true
	timer.start()
	trail.clear_points()
