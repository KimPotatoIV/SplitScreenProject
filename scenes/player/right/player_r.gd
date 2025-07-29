extends CharacterBody2D

##################################################
const SPEED = 100.0
const JUMP_VELOCITY = -300.0

var animated_sprite_node: AnimatedSprite2D

##################################################
func _ready() -> void:
	animated_sprite_node = $AnimatedSprite2D

##################################################
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		animated_sprite_node.play("run")

	if Input.is_action_just_pressed("ui_player_r_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if direction > 0:
			animated_sprite_node.flip_h = true
		elif direction < 0:
			animated_sprite_node.flip_h = false
		if is_on_floor():
			animated_sprite_node.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor():
			animated_sprite_node.play("idle")

	move_and_slide()
