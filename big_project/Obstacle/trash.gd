extends CharacterBody2D

var score = global.obstacle_score
var obj = "trash"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#velocity.x -= 400 * delta
	move_and_slide()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


'''func _on_body_entered(body):
	score = score + 1
	print(score)
	global.obstacle_score = score
	queue_free()'''
