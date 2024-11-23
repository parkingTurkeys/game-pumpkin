extends CharacterBody2D

# i uswd a tutorial for the basics : https://kidscancode.org/godot_recipes/4.x/2d/platform_character/index.html
# tysm!

@onready var _animated_sprite = $AnimatedSprite2D
@export var speed = 50
@export var jump_speed = -1300
@export var gravity = 4000
@export var friction = 20

func _physics_process(delta: float):
	if Input.is_action_pressed("right"):
		_animated_sprite.play("right")
		_animated_sprite.flip_h = false
	elif Input.is_action_pressed("left"):
		_animated_sprite.play("right")
		_animated_sprite.flip_h = true
	else:
		_animated_sprite.play("stand")
	velocity.y += delta * gravity
		
	velocity.x += Input.get_axis("left","right") * speed 
	
	if velocity.x < 0 : 
		velocity.x += friction - velocity.x/15
	elif velocity.x > 0:
		velocity.x -= friction + velocity.x/15
	else: 
		_animated_sprite.stop()
		_animated_sprite.play("stand")
	move_and_slide()
	
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = jump_speed# Called every frame. 'delta' is the elapsed time since the previous frame.
	
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	const _two = 2
	# let starting_position = position

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
