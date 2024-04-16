extends Node2D

var i = 0
var bubble_text = ["Oh no! You just got a call, and it seems that you need to collect as many pieces of trash as possible before it negatively affects the environment and the local ocean life!",
"-Every year, 1 in 3 fish are trapped in plastic, and about 12-14,000 tons of plastic are ingested by fish yearly. That’s the weight of almost 1,000 school buses combined.
-There is around 75-199 million tons of plastic in the ocean as of 2023, about 205 times the weight of the Empire State Building.
-About 260,000 of the estimated 5.25 trillion pieces of plastic in the ocean floats, while 4 billion microfibers per kilometer squared dwell below the surface, meaning for every two people, there is a single piece of trash per kilometer below the surface of the ocean.",
"Use the up and down arrows to collect as much trash as possible. Good Luck!"]
var bubble_text_length = bubble_text[i].length()
var current_text = ""
@onready var label = get_node("MarginContainer/VBoxContainer/Label")

func _ready():
	current_text += bubble_text[i]
	label.text = current_text

func _on_button_pressed():
	i += 1
	if i < 3:
		current_text = ""
		current_text += bubble_text[i]
		label.text = current_text
		#if i == 1:
			#$MarginContainer/VBoxContainer/Label.align = "Left"
	elif i == 3:
		SceneTransition.change_scene("res://Obstacle/course.tscn", "dissolve")


	pass # Replace with function body.
