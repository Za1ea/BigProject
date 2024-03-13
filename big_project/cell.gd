extends Control

var default = true;
var path_color = ""

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
			
			
func set_path_color(color):
	path_color = color
	
func switch_color(color):
	$square/animation.scale = 1*$square/animation.scale
	$square/animation.position = Vector2i(0, 5)
	if color.is_empty():
		$square/animation.animation = "default"
	else:
		$square/animation.animation = color

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
		
