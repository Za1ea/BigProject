extends Node2D

var i = 0
var bubble_text = ["Due to excessive pollution and littering, a large mass of trash has gathered in the center of the ocean, where fish and other organisms are getting trapped and dying. It is so bad that the clump of trash has begun moving on its own, destroying the environment around it. It's up to you to stop it.",
"-705,000 tons of the Great Pacific Garbage Patch is made of fishing nets, the total weight of all of the fishing nets being about 13 times the weight of the titanic.
-The garbage patch is twice the surface area of Texas, outnumbering the sea life there 6:1
-Each year, 100,000 marine animals are found dead from being entangled in plastic. That means about 274 marine animals die from being entangled in plastic every day.",
"Recycle, Reuse, or Clean Up using your knowledge of ocean pollution to deal damage to the monster. If you get the question wrong it will attack you. If you get it right, the monster will be hurt but it may still retaliate. Good Luck!"]
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
	elif i == 3:
		SceneTransition.change_scene("res://Battle/battle.tscn", "dissolve")


	pass # Replace with function body.
