extends CanvasLayer

func _on_replay_pressed():
	SceneTransition.change_scene("res://Route_Ifo.tscn", "dissolve")
	pass # Replace with function body.

func _on_quit_pressed():
	SceneTransition.change_scene("res://map.tscn", "dissolve")
	pass # Replace with function body.
