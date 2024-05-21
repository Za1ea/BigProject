extends Node2D

var cell_scene = preload("res://Sound/cell.tscn")
var win_popup  = preload("res://Sound/win_screen.tscn")
var path_color = ""
var grid       = global.grid
var level1_ans = global.level1_ans

@onready var Grid = $Center/GridContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	global.current_game = "Sound"
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

			Grid.add_child(cell)

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

	var cells = Grid.get_children()

	for cell in cells:
		#print(cell.get_child(0))
		cell.set_path_color(path_color)

#func set_color(button):
#	path_color = button_colors.get(button)

func level1():

	var purple_start = Grid.get_child(0)
	var purple_end   = Grid.get_child(48)
	var white_start = Grid.get_child(7)
	var white_end   = Grid.get_child(18)
	var red_start = Grid.get_child(6)
	var red_end   = Grid.get_child(36)
	var teal_start = Grid.get_child(45)
	var teal_end   = Grid.get_child(47)

	#var whales    = [grid.get_child(8), grid.get_child(9),]
	var endpoints = [purple_start, purple_end, white_start, white_end, red_start, red_end, teal_start, teal_end]
	
	for cell in endpoints:
		cell.fixed = true
	
	purple_start.switch_color("purple")
	purple_end.switch_color("purple")
	white_start.switch_color("yellow")
	white_end.switch_color("yellow")
	red_start.switch_color("red")
	red_end.switch_color("red")
	teal_start.switch_color("teal")
	teal_end.switch_color("teal")
	
	for point in endpoints:
		point.add_to_group("level1")
	
	for i in range(8,12):
		$Center/GridContainer.get_child(i).whale()
		$Center/GridContainer.get_child(i).add_to_group("whales")
	print(grid)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if grid == level1_ans && global.lose==false:
		win()
	elif grid == level1_ans && global.lose==true:
		lose()

func win():
	SceneTransition.change_scene("res://win_screen.tscn","dissolve")
func lose():
	SceneTransition.change_scene("res://Sound/sound_lose_screen.tscn","dissolve")

func _on_restart_pressed():

	for cell in Grid.get_children():

		if !cell.is_in_group("level1"):
			if cell.is_in_group("whales"):
				cell.reset(true)
			else:
				cell.reset()
		
