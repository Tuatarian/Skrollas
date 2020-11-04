extends Node2D

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == BUTTON_WHEEL_UP:
				$Tween.interpolate_property(self, "position", position, Vector2(position.x, position.y - 200), 0.2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
				$Tween.start()
				$Scroll
			if event.button_index == BUTTON_WHEEL_DOWN:
				$Tween.interpolate_property(self, "position", position, Vector2(position.x, position.y + 200), 0.2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
				$Tween.start()
