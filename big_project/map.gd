extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	



func _on_alert_body_entered(body):
	SceneTransition.change_scene_to_file("res://Info.tscn")
	
	


func _on_alert_3_body_entered(body):
	SceneTransition.change_scene_to_file("res://Info.tscn")
	


func _on_alert_2_body_entered(body):
	SceneTransition.change_scene("res://Info.tscn")
