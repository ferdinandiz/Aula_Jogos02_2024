extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "Heroi":
		$Sprite2D.visible = false
		$"som".play(0)
		pass
	pass # Replace with function body.


func _on_som_finished():
	$".".queue_free()
	pass # Replace with function body.
