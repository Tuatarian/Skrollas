extends Node2D

onready var cLevel := get_tree().current_scene.name
onready var nLevel : NodePath = "res://Scenes/Lvl" + str(int(cLevel) + 1) + ".tscn"
onready var initpos : Vector2 = $Plr.position
var won := false
var dead := false
onready var eqip : Vector2 = $eQuote.position

func _ready():
	randomize()

func _physics_process(_delta : float) -> void:
	if dead:
		position = Vector2()
		$eQuote/Tween.stop_all()
		$eQuote.position = eqip
		$MovingLevel/LevelEnd/WinTimer.stop()
		$Plr.show()
		won = false
	
	dead = false
	$sQuote.position.x = lerp($sQuote.position.x, -1920, 0.1)
	
	if won: $Plr.hide()
	else: if $Plr.position.y > 1180 || $Plr.position.y < -300: dead = true


func _on_LevelEnd_body_entered(body : Node2D) -> void:
	if body.name == "Plr":
		if !won:
			Globals.win.play()
			$eQuote/QuoteTimer.start(0.1)
			won = true
			$Plr.won = true

func _on_WinTimer_timeout() -> void:
	won = false
	get_tree().change_scene(nLevel)

func _on_QuoteTimer_timeout() -> void:
	$eQuote/Tween.interpolate_property($eQuote, "position", $eQuote.position, Vector2(), 2.05, Tween.TRANS_ELASTIC, Tween.EASE_OUT); $eQuote/Tween.start()
	$MovingLevel/LevelEnd/WinTimer.start(4)

func _on_dTimer_timeout():
	dead = true
