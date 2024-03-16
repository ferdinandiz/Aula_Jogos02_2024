extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -220.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("cima") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if not is_on_floor():
		$Animacao.play("pular")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("esquerda", "direita")
	if direction:
		velocity.x = direction * SPEED
		if direction > 0 and is_on_floor():
			$Animacao.play("correr")
			$Sprite2D.flip_h = false
			$Sprite2D.offset.x = 0
		if direction < 0 and is_on_floor():
			$Animacao.play("correr")
			$Sprite2D.flip_h = true
			$Sprite2D.offset.x = -4
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor():
			$Animacao.play("idle")
	move_and_slide()



