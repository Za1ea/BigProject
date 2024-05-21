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
@onready var anim = $square/animation

# Called when the node enters the scene tree for the first time.
func _ready():
	anim.animation = "default"
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
	print(color)
	var current = grid[row][col]
	anim.scale = 1*anim.scale
	anim.position = Vector2i(0, 5)
	#print(color)
	#print("current: ", current)
	if $square/animation.animation == "whale":
			global.lose = true
			$square/animation.animation = "dead"
			print(grid)
			
			
	elif color.is_empty() && fixed == false:
	#	print("empty")
		anim.animation = "default"
		current = ""
	
	elif current == color && fixed == false && current != "whale":
	#	print("back")
	#	print(current)
		anim.animation = "default"
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
			anim.animation = color
			#print(color)
			grid[row][col] = color
			
	#print(grid)
func reset(whales = false):
	if whales == true:
		$square/animation.animation = "whale"
		grid[row][col] = "whale"
	else: 
		$square/animation.animation = "default"
		grid[row][col] = ""

func whale():
	anim.scale = 0.5*anim.scale
	anim.position = Vector2i(0, 65)
	anim.animation = "whale"
	anim.play("whale")
	grid[row][col] = "whale"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	if Input.is_action_just_pressed("draw_circle"):
#		default = not default
#		switch_animation()
	pass
		
