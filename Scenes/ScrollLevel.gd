extends Node2D

const move_amount := 200
onready var initpos := position

func _unhandled_input(event):
	if !get_parent().dead:
		if event is InputEventMouseButton:
			if event.is_pressed():
				if event.button_index == BUTTON_WHEEL_UP:
					$Tween.interpolate_property(self, "position", position, Vector2(position.x, position.y - move_amount), 0.2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
					$Tween.start()
					if !$Scroll.playing:
						$Scroll.play()
				if event.button_index == BUTTON_WHEEL_DOWN:
					$Tween.interpolate_property(self, "position", position, Vector2(position.x, position.y + move_amount), 0.2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
					$Tween.start()
					if !$Scroll.playing:
						$Scroll.play()
	if get_parent().dead: position = initpos

func _physics_process(delta):
	if get_parent().dead: 
		position = initpos
		$Tween.stop_all()
