extends Node2D

func _ready():
	pass
	





func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		print("oof")
		get_tree().reload_current_scene()
