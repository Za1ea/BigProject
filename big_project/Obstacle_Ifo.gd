extends Node2D

var i = 0
var bubble_text = ["You got a call from a fellow researcher, there is a school of fish/turtles trapped in plastic, and it is your job to free them. Unfortunately, there is an ocean ravine in your way, but you can navigate through the rocks and crags.",
"-Every year, 1 in 3 fish are trapped in plastic, and about 12-14,000 tons of plastic are ingested by fish yearly. That’s the weight of almost 1,000 school buses combined.
-There is around 75-199 million tons of plastic in the ocean as of 2023, about 205 times the weight of the Empire State Building.
-About 260,000 of the estimated 5.25 trillion pieces of plastic in the ocean floats, while 4 billion microfibers per kilometer squared dwell below the surface, meaning for every two people, there is a single piece of trash per kilometer below the surface of the ocean.",
"Press the left or right buttons to dodge the incoming rocks. Don't crash more than three times, or your submarine will break. Save the Turtles!"]
var bubble_text_length = bubble_text[i].length()
var current_text = ""
@onready var label = get_node("MarginContainer/VBoxContainer/Label")

func _ready():
	current_text += bubble_text[i]
	label.text = current_text

func _on_button_pressed():
	i += 1
	current_text = ""
	current_text += bubble_text[i]
	label.text = current_text


	pass # Replace with function body.
