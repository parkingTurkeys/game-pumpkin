extends CharacterBody2D

# i uswd a tutorial for the basics : https://kidscancode.org/godot_recipes/4.x/2d/platform_character/index.html
# tysm!


@export var speed = 50
@export var jump_speed = -1300
@export var gravity = 4000
@export var friction = 20

func _physics_process(delta: float):
	velocity.y += delta * gravity
		
	velocity.x += Input.get_axis("left","right") * speed 
	
	if velocity.x < 0 : 
		velocity.x += friction - velocity.x/15
	elif velocity.x > 0:
		velocity.x -= friction + velocity.x/15
	move_and_slide()
	
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = jump_speed# Called every frame. 'delta' is the elapsed time since the previous frame.
	
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# func _process(delta: float) -> void:
