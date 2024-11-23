extends Node2D

@onready var scenename = get_tree().get_current_scene().get_name().split("")
@onready var numplusone = str(int(scenename[5]))
# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#str(int(numplusone))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("next lvl!!!")
	if body.name == "player":
		print("lets see which level...")
		print(get_tree().get_current_scene().get_name().split("")[5])
		match int(get_tree().get_current_scene().get_name().split("")[5]):
			1: 
				print("next!")
				get_tree().change_scene_to_file.bind("level_2.tscn").call_deferred()
			2:
				get_tree().change_scene_to_file.bind("level_3.tscn").call_deferred()
			3: 
				get_tree().change_scene_to_file.bind("level_4.tscn").call_deferred()
			4: 
				get_tree().change_scene_to_file.bind("level_5.tscn").call_deferred()
			5: 
				get_tree().change_scene_to_file.bind("end.tscn").call_deferred()



#func next_level() -> void:
	
