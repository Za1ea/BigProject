extends Node2D

@export var trash_scene: PackedScene
@export var obstacle_scene: PackedScene
@export var wreck_scene: PackedScene
var score
var time = 60
var screen_size

@onready var wreck_layer = $ParallaxBackground/WreckLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	global.current_game = "Course"
	start_game()

func start_game():
	$TrashTimer.start()
	$ObstacleTimer.start()
	$WreckTimer.start()
	$ScoreTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print($ParallaxBackground/WreckLayer.position)
	score = global.obstacle_score
	$Score.text = "Score: " + str(score)
	if time == 0:
		SceneTransition.change_scene("res://Obstacle/GameOver.tscn", "")
	if -1650 <= wreck_layer.position.x && wreck_layer.position.x <= -1640:
		for n in wreck_layer.get_children():
			wreck_layer.remove_child(n)
			n.queue_free()
		if randf_range(0.0, 1.0) < 0.4:
			_on_wreck_timer_timeout()


func _on_timer_timeout(extra_arg_0 : String):
	var obj
	# Create a new instance of the Mob scene.
	if extra_arg_0 == "trash":
		obj = trash_scene.instantiate()
	elif extra_arg_0 == "obstacle":
		obj = obstacle_scene.instantiate()

	# Choose a random location on Path2D.
	var spawn_location = $Path/SpawnLoc
	spawn_location.progress_ratio = randf()

	# Set the mob's direction perpendicular to the path direction.
	var direction = spawn_location.rotation + PI / 2

	# Set the mob's position to a random location.
	obj.position = spawn_location.position
	
	set_velocity(obj)

	# Add some randomness to the direction.
	#direction += randf_range(-PI / 4, PI / 4)
	#mob.rotation = direction



func _on_wreck_timer_timeout():
	#var mirror = Vector2(randf_range(1400, 2800), 0)
	#$ParallaxBackground/WreckLayer.set_mirroring(mirror)
	
	var shipwreck = wreck_scene.instantiate()
	print("shipwreck")
	shipwreck.rotation = randf_range(-50.0, 50.0)
	shipwreck.position = Vector2i(1400, 850)
	wreck_layer.add_child(shipwreck)
	
	
	
	
	#set_velocity(shipwreck)

func set_velocity(obj):
	# Choose the velocity for the mob.
	var velocity   = (1000.0 - time*10)
	obj.velocity.x -= velocity
	print(obj.velocity)
	#print(obj.velocity)
	#obj.move_and_slide()
	# Spawn the mob by adding it to the Main scene.
	add_child(obj)


func _on_score_timer_timeout():
	time -= 1
	$Time.text = str(time)
	
