extends Node2D

@export var trash_scene: PackedScene
@export var obstacle_scene: PackedScene
@export var wreck_scene: PackedScene

var score
var time = 60
var screen_size

@onready var wreck_layer = $ParallaxBackground/WreckLayer
@onready var trash_layer = $ParallaxBackground/TrashLayer
@onready var obstacle_layer = $ParallaxBackground/ObstacleLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0
	$Score.text = "Score: 0"
	screen_size = get_viewport_rect().size
	global.current_game = "Course"
	start_game()

func start_game():
	$TrashTimer.start()
	$FishTimer.start()
	$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print($ParallaxBackground/WreckLayer.position)
	score = global.obstacle_score
	$Score.text = "Score: " + str(score)
	if time == 0:
		SceneTransition.change_scene("res://Obstacle/GameOver.tscn", "")
	spawn(wreck_layer, "wreck")
	spawn(trash_layer, "trash")
	spawn(obstacle_layer, "obstacle")

func spawn(layer, obj):
	if -1650 <= layer.position.x && layer.position.x <= -1640:  # spawns wrecks at end of screen so they don't just pop up
		for n in layer.get_children():
			layer.remove_child(n)
			n.queue_free()
		var rand = randf_range(0.0, 1.0)
		if obj == "wreck" && rand < 0.4:
			spawn_wreck()
		if obj == "obstacle" && rand < 0.6:
			spawn_obstacle()
			spawn_obstacle()
		if obj == "trash" && rand < 0.8:
			spawn_trash(obj)
			spawn_trash(obj)

func spawn_trash(extra_arg_0 : String):
	var obj
	# var obj = trash_scene.instantiate()
	# Create a new instance of the Mob scene.
	if extra_arg_0 == "trash":
		obj = trash_scene.instantiate()
		obj.set_type("trash")
	if extra_arg_0 == "obstacle":
		obj = obstacle_scene.instantiate()
		obj.set_type("obstacle")
		
	print(extra_arg_0)
	# Choose a random location on Path2D.
	var spawn_location = $Path/SpawnLoc
	spawn_location.progress_ratio = randf()

	# Set the mob's direction perpendicular to the path direction.
	var direction = spawn_location.rotation + PI / 2

	# Set the mob's position to a random location.
	obj.position = spawn_location.position
	
	set_velocity(obj)
	'''
	var spawn_location = $Path/SpawnLoc
	spawn_location.progress_ratio = randf()
	#var direction = spawn_location.rotation + PI / 2
	obj.position = spawn_location.position
	#obj.rotation = direction
	print(obj.position)
	obj.set_type(extra_arg_0)
	trash_layer.add_child(obj)

	# Add some randomness to the direction.
	#direction += randf_range(-PI / 4, PI / 4)
	#mob.rotation = direction
	'''

func spawn_obstacle():
	print("obstacle")
	var obstacle = obstacle_scene.instantiate()
	# Choose a random location on Path2D.
	var spawn_location = $Path/SpawnLoc
	spawn_location.progress_ratio = randf()

	# Set the mob's direction perpendicular to the path direction.
	var direction = spawn_location.rotation + PI / 2

	# Set the mob's position to a random location.
	obstacle.position = spawn_location.position
	#obstacle.position = Vector2i(1400, 650)
	obstacle.set_type("obstacle")
	#obstacle_layer.add_child(obstacle)
	set_velocity(obstacle)

func spawn_wreck():
	#var mirror = Vector2(randf_range(1400, 2800), 0)
	#$ParallaxBackground/WreckLayer.set_mirroring(mirror)
	
	var shipwreck = wreck_scene.instantiate()
	shipwreck.rotation = randf_range(-PI/3, PI/3)
	print(shipwreck.rotation)
	shipwreck.position = Vector2i(1400, 850)
	shipwreck.set_type("wreck")
	wreck_layer.add_child(shipwreck)
	
	#set_velocity(shipwreck)

func set_velocity(obj):
	# Choose the velocity for the mob.
	var velocity   = (1500.0 - time*10)
	obj.velocity.x -= velocity
	#print(obj.position)
	#print(obj.velocity)
	#obj.move_and_slide()
	# Spawn the mob by adding it to the Main scene.
	add_child(obj)


func _on_score_timer_timeout():
	time -= 1
	$Time.text = str(time)
	
