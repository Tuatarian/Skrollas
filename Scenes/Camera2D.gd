extends Camera2D

var decay = 0.1 # Time to stop shaking
var max_offset = Vector2(100, 75) # 2D movement shake
var max_roll = 0.1  # Rotational Shake, radians

var rotator = 0.0  # Shake str
var trauma_power = 0  # Trauma exponent. Use [2, 3].
var shake_amount = 1.0

func _process(delta):
	set_offset(Vector2( \
		rand_range(-1.0, 1.0) * shake_amount, \
		rand_range(-1.0, 1.0) * shake_amount \
	))
