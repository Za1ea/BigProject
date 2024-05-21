extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	if global.intro == 0:
		$intro.visible = true
		$Button.visible = true
	elif global.intro == 1:
		get_node("Button2").disabled = false
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_node("intro").hide()
	get_node("Button").hide()
	get_node("Button2").disabled = false
	pass # Replace with function body.


func _on_button_2_pressed():
	SceneTransition.change_scene("res://map.tscn", "")
	pass # Replace with function body.


func _on_button_3_pressed():
	global.port = 1
	SceneTransition.change_scene("res://windows.tscn", "dissolve")
	pass # Replace with function body.


func _on_button_4_pressed():
	global.port = 2
	SceneTransition.change_scene("res://windows.tscn", "dissolve")
	pass # Replace with function body.
