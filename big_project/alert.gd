extends Area2D
signal hit

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("big")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	hit.emit()
	get_tree().change_scene_to_file("res://Info.tscn")
	$CollisionShape2D.set_deferred("disabled", true)
	pass # Replace with function body.
