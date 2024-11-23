extends Node2D

func _ready():
	pass
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "char":
		get_tree().reload_current_scene()
