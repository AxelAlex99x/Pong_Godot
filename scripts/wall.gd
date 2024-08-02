extends Area2D

signal ball_out(wall_name)
@export var bouncy = false

func _on_area_entered(area):
	if area is Ball:
		if bouncy:
			area.direction.y *= -1
			area.on_collision()
		else:
			emit_signal("ball_out", name)
			area.queue_free()
