extends Node2D

var path_color = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_color(color):
	path_color = color

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
<<<<<<< Updated upstream:big_project/cell_vars.gd
	pass
=======
	
	scroll_offset.x -= 400 * delta
	#print(delta)

>>>>>>> Stashed changes:big_project/Obstacle/scroll.gd
