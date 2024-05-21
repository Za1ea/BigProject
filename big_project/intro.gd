extends Node2D

var bubble_text = "Welcome, Researcher! You are an oceanographer, tasked with helping people and animals around the world with their aquatic issues. You are constantly getting calls to your submarine, and you have a lot to do! Take a look out the portholes or choose your task by opening your challenge map, and help the Ocean!"
var can_shrink = true
var bubble_text_length = 0
var bubble_text_index = 0
var current_text = ""
@onready var timer = get_node("Timer")
@onready var lbltext = get_node("VBoxContainer/Label")
@onready var ninerect = get_node("VBoxContainer/Label/NinePatchRect")
var do_close = false

func _ready():
	bubble_text_length = bubble_text.length()
	timer.start(1)
	pass # Replace with function body.





func _on_timer_timeout():
	if(!do_close):
		current_text += bubble_text[bubble_text_index]
		lbltext.text = current_text
		
		if(bubble_text_index < bubble_text_length -1):
			timer.start(0.04)
			bubble_text_index += 1
		else:
			if(!do_close):
				do_close = true
				timer.start(1)
	
		
	pass # Replace with function body.


