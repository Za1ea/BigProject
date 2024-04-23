extends Node2D

var cell_scene = preload("res://Sound/cell.tscn")
var win_popup  = preload("res://Sound/win_screen.tscn")
var path_color = ""
var grid       = global.grid
var level1_ans = global.level1_ans

@onready var Grid = $Center/GridContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	# create a 6x6 grid
	var rows = 7
	var cols = 7
	var cell_size = Vector2(130, 130)
#	print(cell_size)
	for row in range(rows):
		grid.append([])
		for col in range(cols):
			var idx = str(row*7+col)
#			print("cell")
			var cell = cell_scene.instantiate()
<<<<<<< Updated upstream
			$GridContainer.add_child(cell)
=======
			Grid.add_child(cell)
>>>>>>> Stashed changes
			cell.add_to_group("cells")
			cell.row = row
			cell.col = col
			cell.position = Vector2(col * cell_size.x + 100, row * cell_size.x + 100)
			grid[row].append("")
			
	level1()
	#print(grid)


func _on_ship_pressed(extra_arg_0: String):
	path_color = extra_arg_0
	#print(path_color)
<<<<<<< Updated upstream
	var cells = $GridContainer.get_children()
=======
	var cells = Grid.get_children()
>>>>>>> Stashed changes
	for cell in cells:
		#print(cell.get_child(0))
		cell.set_path_color(path_color)

#func set_color(button):
#	path_color = button_colors.get(button)

func level1():
<<<<<<< Updated upstream
	var purple_start = $GridContainer.get_child(0)
	var purple_end   = $GridContainer.get_child(48)
	var white_start = $GridContainer.get_child(7)
	var white_end   = $GridContainer.get_child(18)
	var red_start = $GridContainer.get_child(6)
	var red_end   = $GridContainer.get_child(36)
	var teal_start = $GridContainer.get_child(45)
	var teal_end   = $GridContainer.get_child(47)
=======
	var purple_start = Grid.get_child(0)
	var purple_end   = Grid.get_child(48)
	var white_start = Grid.get_child(7)
	var white_end   = Grid.get_child(18)
	var red_start = Grid.get_child(6)
	var red_end   = Grid.get_child(36)
	var teal_start = Grid.get_child(45)
	var teal_end   = Grid.get_child(47)
>>>>>>> Stashed changes
	#var whales    = [grid.get_child(8), grid.get_child(9),]
	var endpoints = [purple_start, purple_end, white_start, white_end, red_start, red_end, teal_start, teal_end]
	
	for cell in endpoints:
		cell.fixed = true
	
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
<<<<<<< Updated upstream
		$GridContainer.get_child(i).whale()
		$GridContainer.get_child(i).add_to_group("level1")
=======
		Grid.get_child(i).whale()
		Grid.get_child(i).add_to_group("level1")
>>>>>>> Stashed changes


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if grid == level1_ans:
		go_home()

func go_home():
	print("win")
	#win_popup.instantiate()
	SceneTransition.change_scene("res://Sound/win_screen.tscn","dissolve")

func _on_restart_pressed():
<<<<<<< Updated upstream
	for cell in $GridContainer.get_children():
=======
	for cell in Grid.get_children():
>>>>>>> Stashed changes
		if !cell.is_in_group("level1"):
			cell.reset()
		

