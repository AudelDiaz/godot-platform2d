extends CharacterBody2D


const SPEED = 100.0
const RUN_SPEED = 140.0
var run_effect_is_active: bool = false
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

signal run_effect

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if is_on_floor():
		if direction:
			animated_sprite.play("run")
		else:
			animated_sprite.play("idle")
	else:
		animated_sprite.play("jump")
		
	if direction:
		if direction > 0:
			animated_sprite.flip_h=false
		else:
			animated_sprite.flip_h=true
		velocity.x = direction * (RUN_SPEED if (run_effect_is_active or Input.is_action_pressed("run")) else SPEED)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func start_run_effect() -> void:
	run_effect.emit()

func enable_material(custom_material: Material) -> void:
	animated_sprite.material = custom_material
