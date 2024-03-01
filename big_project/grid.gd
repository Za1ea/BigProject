extends Node2D

var cell_scene = preload("res://cell.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	# create a 6x6 grid
	var rows = 7
	var cols = 7
	var cell_size = Vector2(130, 130)
	print(cell_size)
	for row in range(rows):
		for col in range(cols):
			print("cell")
			var cell = cell_scene.instantiate()
			$GridContainer.add_child(cell)
			cell.position = Vector2(col * cell_size.x + 100, row * cell_size.x + 100)
	level1()

func level1():
	var colors = ["purple", "white", "red", "teal"]
	var purple_start = $GridContainer.get_child(0).get_child(0)
	var purple_end   = $GridContainer.get_child(48).get_child(0)
	var white_start = $GridContainer.get_child(7).get_child(0)
	var white_end   = $GridContainer.get_child(18).get_child(0)
	var red_start = $GridContainer.get_child(6).get_child(0)
	var red_end   = $GridContainer.get_child(36).get_child(0)
	var teal_start = $GridContainer.get_child(45).get_child(0)
	var teal_end   = $GridContainer.get_child(47).get_child(0)
	var endpoints = [purple_start, purple_end, white_start, white_end, red_start, red_end, teal_start, teal_end]
	
	purple_start.switch_color("purple")
	purple_end.switch_color("purple")
	white_start.switch_color("white")
	white_end.switch_color("white")
	red_start.switch_color("red")
	red_end.switch_color("red")
	teal_start.switch_color("teal")
	teal_end.switch_color("teal")
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
