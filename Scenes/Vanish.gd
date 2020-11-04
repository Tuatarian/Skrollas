extends Area2D

func _on_Area2D_body_entered(body):
	if body.name == "Plr":
		print("yes")
		get_parent().get_node("DisappearingTiles").set_cellv(position, -1)
