extends Node2D

const move_amount := -400
onready var initpos := position

func _unhandled_input(event):
	if !get_parent().get_parent().dead:
		if event is InputEventMouseButton:
			if event.is_pressed():
				if event.button_index == BUTTON_WHEEL_UP:
					get_parent().get_node("Tween").interpolate_property(self, "position", position, Vector2(position.x, position.y - move_amount), 0.2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
					get_parent().get_node("Tween").start()
					if !get_parent().get_node("Scroll").playing:
						get_parent().get_node("Scroll").play()
				if event.button_index == BUTTON_WHEEL_DOWN:
					get_parent().get_node("Tween").interpolate_property(self, "position", position, Vector2(position.x, position.y + move_amount), 0.2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
					get_parent().get_node("Tween").start()
					if !get_parent().get_node("Scroll").playing:
						get_parent().get_node("Scroll").play()

func _physics_process(_delta : float):
	if get_parent().get_parent().dead: position = initpos
