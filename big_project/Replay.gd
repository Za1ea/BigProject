extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_replay_pressed():
	var game = global.current_game
	print(game)
	if game == "Sound":
		SceneTransition.change_scene("res://Sound/grid.tscn", "dissolve")
	elif game == "Battle":
		SceneTransition.change_scene("res://Battle/battle.tscn", "dissolve")
	elif game == "Course":
		SceneTransition.change_scene("res://Obstacle/course.tscn", "dissolve")
