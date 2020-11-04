extends AudioStreamPlayer

var wasPlaying := false

func _process(delta):
	if !playing && autoplay:
		play()
