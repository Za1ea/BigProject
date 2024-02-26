extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$square.animation = "default"
	set_process_input(true)
	
func _gui_input(event):
	if event is InputEventMouseButton:
		print("clicked")
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			$square.animation = "circle"
			
			
#func spawn_circle():
#	var circle = Sprite2D.new()
#	circle.position = Vector2(get_size().x / 2, get_size().y / 2)
#	add_child(circle)
#			


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		
		
#func _draw():
#	if Input.action_is_pressed("draw_circle"):
#		draw_circle(Vector2(50,50), 10, Color.WHITE)
