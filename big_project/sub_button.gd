extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	global.intro = 1
	SceneTransition.change_scene("res://sub_home.tscn", "dissolve")
	pass # Replace with function body.
