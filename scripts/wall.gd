extends Area2D

signal ball_out(wall_name)
@export var bouncy = false



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_area_entered(area):
	if area.name == "Ball":
		if bouncy:
			area.direction.y *= -1
		else:
			emit_signal("ball_out", name)
			area.queue_free()
