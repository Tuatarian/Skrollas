extends KinematicBody2D

const GRAV := 100
const WSPEED := 650
const JSPEED := -1500
var velo := Vector2()
var up := Vector2(0, -1)
var won := false
onready var initpos := position
onready var rngenerator = RandomNumberGenerator.new()
export (Array, AudioStream) var jSounds 

func _ready():
	randomize()
	
func _physics_process(_delta):
	velo.x *= 0.3
	if Input.is_action_pressed("ui_left"):
		velo.x = max(velo.x + -WSPEED, -1000)
	if Input.is_action_pressed("ui_right"):
		velo.x = min(velo.x + WSPEED, 1000)
		
	move_and_slide(velo, up)
	
	if is_on_floor():
		velo.y = JSPEED
		if !get_parent().won:
			$Jump.stream = jSounds[rngenerator.randi_range(0, jSounds.size() - 1)]
			$Jump.play()
	else: velo.y += GRAV
	
	if Input.is_action_pressed("ui_reset"): get_parent().dead = true
	
	if get_parent().dead: 
		position = initpos
		velo = Vector2()
