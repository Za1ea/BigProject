extends Control

var default = true
var path_color = ""
var grid = global.grid
var row = 0
var col = 0
var index = 0
var rmin = 0
var rmax = 6
var cmin = 0
var cmax = 6
var fixed = false
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
	var current = grid[row][col]
	$square/animation.scale = 1*$square/animation.scale
	$square/animation.position = Vector2i(0, 5)
	#print(color)
	#print("current: ", current)
	if color.is_empty():
	#	print("empty")
		$square/animation.animation = "default"
		current = ""
	
	elif current == color && fixed == false && current != "whale":
	#	print("back")
	#	print(current)
		$square/animation.animation = "default"
		grid[row][col] = ""
	
	elif current == "" && !color.is_empty() && current != "whale":
	#	print(color)	
		var a = Vector2i(max(row-1, rmin), col)
		var b = Vector2i(min(row+1, rmax), col)
		var l = Vector2i(row, max(col-1, cmin))
		var r = Vector2i(row, min(col+1, cmax))
		#print(grid)
		#print(grid[a.x][a.y], grid[b.x][b.y], grid[l.x][l.y], grid[r.x][r.y])
		if (grid[a.x][a.y] == color || grid[b.x][b.y] == color || grid[l.x][l.y] == color || grid[r.x][r.y] == color || fixed == true):
			$square/animation.animation = color
			#print(color)
			grid[row][col] = color
			
	#print(grid)

func reset():
	$square/animation.animation = "default"
	grid[row][col] = ""

func whale():
	$square/animation.scale = 0.5*$square/animation.scale
	$square/animation.position = Vector2i(0, 65)
	$square/animation.animation = "whale"
	$square/animation.play("whale")
	grid[row][col] = "whale"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	if Input.is_action_just_pressed("draw_circle"):
#		default = not default
#		switch_animation()
	pass
		
