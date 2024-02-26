extends Node2D

var cell_scene = preload("res://cell.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	# create a 6x6 grid
	var rows = 6
	var cols = 6
	var cell_size = get_node("cell/Control/Sprite2D").texture.get_size()
	print(cell_size)
	for row in range(rows):
		for col in range(cols):
			print("cell")
			var cell = cell_scene.instantiate()
			$GridContainer.add_child(cell)
			cell.position = Vector2(col * cell_size.x + 100, row * cell_size.x + 100)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
