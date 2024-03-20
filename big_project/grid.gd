extends Node2D

var cell_scene = preload("res://cell.tscn")
var path_color = ""
var grid       = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	# create a 6x6 grid
	var rows = 7
	var cols = 7
	var cell_size = Vector2(130, 130)
	print(cell_size)
	for row in range(rows):
		for col in range(cols):
			var idx = str(row*7+col)
			print("cell")
			var cell = cell_scene.instantiate()
			$GridContainer.add_child(cell)
			cell.add_to_group("cells")
			cell.position = Vector2(col * cell_size.x + 100, row * cell_size.x + 100)
			grid[idx] = ""
	level1()
	


func _on_ship_pressed(extra_arg_0: String):
	path_color = extra_arg_0
	var cells = $GridContainer.get_children()
	for cell in cells:
		#print(cell.get_child(0))
		cell.set_path_color(path_color)

#func set_color(button):
#	path_color = button_colors.get(button)

func level1():
	var colors = ["purple", "white", "red", "teal"]
	var purple_start = $GridContainer.get_child(0)
	var purple_end   = $GridContainer.get_child(48)
	var white_start = $GridContainer.get_child(7)
	var white_end   = $GridContainer.get_child(18)
	var red_start = $GridContainer.get_child(6)
	var red_end   = $GridContainer.get_child(36)
	var teal_start = $GridContainer.get_child(45)
	var teal_end   = $GridContainer.get_child(47)
	#var whales    = [grid.get_child(8), grid.get_child(9),]
	var endpoints = [purple_start, purple_end, white_start, white_end, red_start, red_end, teal_start, teal_end]
	
	purple_start.switch_color("purple")
	purple_end.switch_color("purple")
	white_start.switch_color("white")
	white_end.switch_color("white")
	red_start.switch_color("red")
	red_end.switch_color("red")
	teal_start.switch_color("teal")
	teal_end.switch_color("teal")
	
	for point in endpoints:
		point.add_to_group("level1")
	
	for i in range(8,12):
		$GridContainer.get_child(i).whale()
		$GridContainer.get_child(i).add_to_group("level1")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for child in $GridContainer.get_children():
		pass


func _on_restart_pressed():
	for cell in $GridContainer.get_children():
		if !cell.is_in_group("level1"):
			cell.switch_color("")
