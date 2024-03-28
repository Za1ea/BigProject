extends Node2D

var i = 0
var bubble_text = ["Due to excessive pollution and littering, a large mass of trash has gathered in the center of the ocean, where fish and other organisms are getting trapped and dying, and it is so bad that the clump of trash has begun moving on its own, destroying the environment around it. Your job is to safely remove the fish from the trash, and recycle all the trash that is keeping the fish trapped.",
"-705,000 tons of the Great Pacific Garbage Patch is made of fishing nets, the total weight of all of the fishing nets being about 13 times the weight of the titanic.
-The garbage patch is twice the surface area of Texas, outnumbering the sea life there 6:1
-Each year, 100,000 marine animals are found dead from being entangled in plastic. That means about 274 marine animals die from being entangled in plastic every day.",
"Press the left or right button to grab at any fish or pieces of trash hanging out of the monster. Press space to dodge any incoming attacks. Don't stop until it is all gone!"]
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
