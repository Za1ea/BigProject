extends CanvasLayer

func change_scene(target: String, type: String) -> void:
	if type == 'dissolve':
		transition_dissolve(target)
	else:
		transition_clouds(target)

func transition_dissolve(target: String) -> void:
	$AnimationPlayer.play('dissolve')
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file(target)
	
	$AnimationPlayer.play_backwards('dissolve')

	
func transition_clouds(target: String) -> void:
	$AnimationPlayer.play('clouds_in')
	await get_tree().create_timer(1).timeout
	$AnimationPlayer.play('clouds_out')
	get_tree().change_scene_to_file(target)
	


