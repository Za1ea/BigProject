extends Control

var trivia = global.trivia
var questions = trivia["recycle"]
var regex = RegEx.new()


@export var max_player_health: int = 50
@export var max_trash_health: int = 100

var current_player_health = max_player_health
var current_trash_health  = max_trash_health

var damages = {
	"recycle": 5,
	"reuse": 10,
	"clean_up": 15
}
var damage = damages["recycle"]
var enemy_damages = [5, 10]
var chosen

@onready var trash_sprite = $TrashContainer/TrashMonster
@onready var player_sprite = $PlayerContainer/Player

# Called when the node enters the scene tree for the first time.
func _ready():
	trivia = global.trivia.duplicate(true)
	questions = trivia["recycle"]
	global.current_game = "Battle"
	$TrashContainer/ProgressBar.max_value = max_trash_health
	$TrashContainer/ProgressBar.value = max_trash_health
	$PlayerContainer/ProgressBar.max_value = max_player_health
	$PlayerContainer/ProgressBar.value = max_player_health
	set_health($PlayerContainer/ProgressBar, current_player_health, max_player_health)
	set_health($TrashContainer/ProgressBar, current_trash_health, max_trash_health)
	$Trivia.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if current_player_health == 0:
		SceneTransition.change_scene("res://lose_screen.tscn", "dissolve")


func attack(extra_arg_0: String):	
	var button = extra_arg_0
	damage = damages[button]
	questions = trivia[button]
	
	if !questions.is_empty():
		$Trivia.show()
		
		var question   = questions.keys().pick_random()
		var options    = questions[question]
		var optionbtns = [$Trivia/Options/Option1, $Trivia/Options/Option2, $Trivia/Options/Option3]
	
		$Trivia/Question.text = question
		$EnemyDamage.text = "-" + str(damage)
		
		randomize()
		options.shuffle()
		
		for i in range(3):
			optionbtns[i].pressed.disconnect(self.correct)
			optionbtns[i].pressed.disconnect(self.incorrect)
			var split = options[i].split("~") # splits each option into t or f then the option
			#print(split[0].get_string(), split[1].get_string())
			#for result in regex.search_all(option):
			var option = split[1]
			optionbtns[i].text = option # gets only the option and displays on button
		
			# check if it's the right answer
			if split[0] == "t":
				optionbtns[i].pressed.connect(self.correct)
				questions.erase(question)
			else:
				optionbtns[i].pressed.connect(self.incorrect)

	else:
		$TryNewMove.vis = true
		await get_tree().create_timer(2.0).timeout
		$TryNewMove.vis = false

func correct():
	#chosen = extra_arg_0
	
	$Trivia.hide()
	await get_tree().create_timer(0.5).timeout
	current_trash_health = max(0, current_trash_health - damage)
	$EnemyDamage.vis = true
	trash_sprite.play("damage")
	set_health($TrashContainer/ProgressBar, current_trash_health, max_trash_health)
	await get_tree().create_timer(0.8).timeout
	trash_sprite.stop()
	await get_tree().create_timer(1.2).timeout
	$EnemyDamage.vis = false
	if current_trash_health == 0:
		SceneTransition.change_scene("res://Battle/win_screen2.tscn", "dissolve")
	else:
		await get_tree().create_timer(0.5).timeout
		enemy_turn(true)

func enemy_turn(correct):
	var chance = randf_range(0.0, 1.0)
	
	var enemy_damage
	
	if !correct:
		enemy_damage = enemy_damages[1]
		$PlayerDamage.vis = true
		player_sprite.play("damage")
		
	elif chance >= 0.5 && correct:
		enemy_damage = enemy_damages[0]
		$PlayerDamage.vis = true
		player_sprite.play("damage")
		
	else:
		enemy_damage = 0
		
	$PlayerDamage.text = "-" + str(enemy_damage)
	
	current_player_health = max(0, current_player_health - enemy_damage)
	set_health($PlayerContainer/ProgressBar, current_player_health, max_player_health)
	
	await get_tree().create_timer(0.8).timeout
	player_sprite.stop()
	await get_tree().create_timer(1.2).timeout
	$PlayerDamage.vis = false

func incorrect():
	$Trivia.hide()
	await get_tree().create_timer(1.0).timeout
	enemy_turn(false)
	
func set_health(progress_bar, health, max_health):
	progress_bar.value = health
	progress_bar.max_value = max_health
	progress_bar.get_node("Label").text = "HP: %d/%d" % [health, max_health]
