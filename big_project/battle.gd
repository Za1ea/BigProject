extends Control

var trivia = global.trivia
var questions = trivia["recycle"]
var regex = RegEx.new()

var current_player_health = 50
var max_player_health     = 50
var current_trash_health  = 50
var max_trash_health      = 50
var damages = {
	"recycle": 5,
	"reuse": 10,
	"clean_up": 15
}
var damage = damages["recycle"]
var enemy_damage = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	set_health($PlayerContainer/ProgressBar, current_player_health, max_player_health)
	set_health($TrashContainer/ProgressBar, current_trash_health, max_trash_health)
	$Trivia.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func attack(extra_arg_0: String):
	$Trivia.show()
	
	var button = extra_arg_0
	damage = damages[button]
	questions = trivia[button]
	
	var question1  = questions.keys().pick_random()
	var options    = questions[question1]
	var optionbtns = [$Trivia/Options/Option1, $Trivia/Options/Option2, $Trivia/Options/Option3]
	
	$Trivia/Question.text = question1
	
	randomize()
	options.shuffle()
	
	regex.compile("\\w+") 
	for i in range(3):
		optionbtns[i].pressed.disconnect(self.correct)
		optionbtns[i].pressed.disconnect(self.incorrect)
		var split = regex.search_all(options[i]) # splits each option into t or f then the option
		#print(split[0].get_string(), split[1].get_string())
		#for result in regex.search_all(option):
		var option = split.slice(1,split.size())
		var option_text = ""
		for elem in option:
			option_text += elem.get_string() + " "
		optionbtns[i].text = option_text # gets only the option and displays on button
		
		# check if it's the right answer
		if split[0].get_string() == "t":
			optionbtns[i].pressed.connect(self.correct)
			
		else:
			optionbtns[i].pressed.connect(self.incorrect)

func correct():
	$Trivia.hide()
	await get_tree().create_timer(0.5).timeout
	current_trash_health = max(0, current_trash_health - damage)
	$enemyDamage.vis = true
	set_health($TrashContainer/ProgressBar, current_trash_health, max_trash_health)
	await get_tree().create_timer(2.0).timeout
	$enemyDamage.vis = false
	if current_trash_health == 0:
		print("you win!")
	else:
		await get_tree().create_timer(0.25).timeout
		enemy_turn()

func enemy_turn():
	$playerDamage.vis = true
	current_player_health = max(0, current_player_health - enemy_damage)
	set_health($PlayerContainer/ProgressBar, current_player_health, max_player_health)
	await get_tree().create_timer(2.0).timeout
	$playerDamage.vis = false

func incorrect():
	$Trivia.hide()
	print("wrong")
	await get_tree().create_timer(1.0).timeout
	enemy_turn()
	
func set_health(progress_bar, health, max_health):
	progress_bar.value = health
	progress_bar.max_value = max_health
	progress_bar.get_node("Label").text = "HP: %d/%d" % [health, max_health]
