extends CharacterBody2D

@export var speed: float = 150.0

var direction := Vector2.ZERO
var last_direction: String = "down"

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:

	direction = Vector2.ZERO

	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

	if direction.length() > 0:
		direction = direction.normalized()
		velocity = direction * speed
	else:

		velocity = Vector2.ZERO

	move_and_slide()

	update_animation(direction)

func update_animation(dir: Vector2) -> void:
	var new_animation = ""

	if dir.length() > 0:
		if abs(dir.x) > abs(dir.y):
			if dir.x > 0:
				new_animation = "right"
				last_direction = "right"
			else:
				new_animation = "left"
				last_direction = "left"  
		else:
			if dir.y > 0:
				new_animation = "down"
				last_direction = "down"  
			else:
				new_animation = "up"
				last_direction = "up"    

	else:
			new_animation = "idle_" + last_direction

	if animated_sprite.animation != new_animation:
		if animated_sprite.sprite_frames.has_animation(new_animation):
			animated_sprite.play(new_animation)

	else:
		print("ERRO: Animação '" + new_animation + "' não encontrada no AnimatedSprite2D.")
