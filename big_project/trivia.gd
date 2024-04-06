extends Panel

var questions = get_node(".").questions

# Called when the node enters the scene tree for the first time.
func _ready():
	questions[questions.keys().pick_random()]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
