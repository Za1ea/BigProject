extends ParallaxBackground

var time = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = 1.0
	timer.timeout.connect(_on_timer_timeout)
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	scroll_offset.x -= 250 * delta * (time)
	#print(delta)

func _on_timer_timeout():
	time += 0.1
