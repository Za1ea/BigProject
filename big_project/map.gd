extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	



func _on_alert_body_entered(body):
	get_tree().change_scene_to_file("res://Info.tscn")
	print("alert1")
	pass # Replace with function body.


func _on_alert_3_body_entered(body):
	print("alert3")
	pass # Replace with function body.


func _on_alert_2_body_entered(body):
	print("alert2")
	push_error()
	pass # Replace with function body.