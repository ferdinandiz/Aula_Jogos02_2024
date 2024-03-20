extends CharacterBody2D


const SPEED = 50.0
const JUMP_VELOCITY = -400.0
var MORTE = false
var VISAO = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	velocity.x = 0	
	if VISAO and not MORTE:
		#print ("Vilão: ",$".".position.x, "Heroi: ", $".".get_parent().get_node("Heroi").position.x, "Valor: ",$".".position.x - $".".get_parent().get_node("Heroi").position.x)
		if $".".position.x - $".".get_parent().get_node("Heroi").position.x > 0:
			velocity.x = -SPEED
		else: 
			velocity.x = SPEED
	move_and_slide()
	


func _on_hit_box_body_entered(body):
	if body.name == "Heroi" and not MORTE:
		body.velocity.y = -220.0
		$AnimatedSprite2D.play("morte")
		MORTE = true
	pass # Replace with function body.


func _on_animated_sprite_2d_animation_finished():
	if $AnimatedSprite2D.get_animation() == "morte":
		queue_free()
		pass
	pass # Replace with function body.


func _on_visao_body_entered(body):
	if body.name == "Heroi" and not MORTE:
		VISAO = true
	pass # Replace with function body.


func _on_visao_body_exited(body):
	if body.name == "Heroi" and not MORTE:
		VISAO = false
	pass # Replace with function body.
