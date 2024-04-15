extends Node2D

@export var trash_scene: PackedScene
@export var obstacle_scene: PackedScene
@export var wreck_scene: PackedScene
var score
var time = 60

# Called when the node enters the scene tree for the first time.
func _ready():
	global.current_game = "Course"
	start_game()

func start_game():
	$TrashTimer.start()
	$ObstacleTimer.start()
	$WreckTimer.start()
	$ScoreTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	score = global.obstacle_score
	$Score.text = "Score: " + str(score)
	if time == 0:
		SceneTransition.change_scene("res://Obstacle/GameOver.tscn", "dissolve")
	if $SubPlayer.global_position.y < 0:
		$SubPlayer.global_position.y == 0
	elif $SubPlayer.global_position.y > 1000:
		$SubPlayer.global_position.y == 1000


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
	var shipwreck = wreck_scene.instantiate()
	
	shipwreck.position = Vector2i(1200, 900)
	
	set_velocity(shipwreck)

func set_velocity(obj):
	# Choose the velocity for the mob.
	var velocity   = (2000.0 - time*18)
	obj.velocity.x -= velocity
	#print(obj.velocity)
	#obj.move_and_slide()
	# Spawn the mob by adding it to the Main scene.
	add_child(obj)


func _on_score_timer_timeout():
	time -= 1
	$Time.text = str(time)
	
