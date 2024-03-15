extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_node("intro").hide()
	get_node("Button").hide()
	get_node("Button2").disabled = false
	pass # Replace with function body.


func _on_button_2_pressed():
	SceneTransition.change_scene("res://map.tscn")
	pass # Replace with function body.
