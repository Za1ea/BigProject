extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$GameOverMsg.text = "You collected " + str(global.obstacle_score) + " pieces of trash!"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_again_pressed():
	SceneTransition.change_scene("res://Obstacle/course.tscn", "dissolve")
