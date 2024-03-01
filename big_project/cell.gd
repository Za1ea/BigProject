extends Control

var default = true;

# Called when the node enters the scene tree for the first time.
func _ready():
	$square.animation = "default"
	set_process_input(true)
	
func _gui_input(event):
#	if event is InputEventMouseButton:
	if Input.is_action_just_pressed("draw_circle"):
		default = not default
		switch_animation()
#		print("clicked")
#		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
#			default = not default
#			switch_animation()
			
			
func switch_animation():
	if default:
		$square.animation = "default"
	if not default:
		$square.animation = "circle"
#			


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	if Input.is_action_just_pressed("draw_circle"):
#		default = not default
#		switch_animation()
	pass
		
