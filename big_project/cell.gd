extends Control

var default = true
var path_color = ""
var grid = global.grid
var row = 0
var col = 0
var index = 0
#var anim = get_tree().square.animation

# Called when the node enters the scene tree for the first time.
func _ready():
	$square/animation.animation = "default"
	set_process_input(true)
	
func _gui_input(event):
#	if event is InputEventMouseButton:
	if Input.is_action_just_pressed("draw_circle"):
		switch_color(path_color)
#		print("clicked")
#		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
#			default = not default
#			switch_animation()
			

#func set_index(row, col):
#	row = row
#	col = col
#	print(row, col)

func set_path_color(color):
	path_color = color
	
func switch_color(color):
	$square/animation.scale = 1*$square/animation.scale
	$square/animation.position = Vector2i(0, 5)
	if color.is_empty():
		$square/animation.animation = "default"
		grid[row][col] = ""
	else:
		var current = Vector2i(row, col)
		var a = Vector2i(row-1, col)
		var b = Vector2i(row-1, col)
		var l  = Vector2i(row  , col-1)
		var r = Vector2i(row  , col+1) 
		if (row == 0):
			a = current
		elif (row == 6):
			b = current
		if (col == 0):
			l = current
		elif (col == 7):
			r = current
		if (grid[a.x][a.y] == color || grid[a.x][a.y] == color || grid[a.x][a.y] == color || grid[a.x][a.y] == color):
			$square/animation.animation = color
			#print(row, col)
			grid[row][col] = color
	#print(grid)

func whale():
	$square/animation.scale = 0.5*$square/animation.scale
	$square/animation.position = Vector2i(0, 65)
	$square/animation.animation = "whale"
	$square/animation.play("whale")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	if Input.is_action_just_pressed("draw_circle"):
#		default = not default
#		switch_animation()
	pass
		
