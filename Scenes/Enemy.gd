extends KinematicBody2D

var positions
var i

func _physics_process(delta):
	if positions.size() > i: queue_free()
	move_and_slide(positions[i])
	i += 1
