extends Control
var nivel = 1

func _on_timer_timeout() -> void:
	$TextureProgressBar.value +=1
	pass # Replace with function body.


func _on_button_pressed() -> void:
	$TextureProgressBar.value +=50
	pass # Replace with function body.


func _on_texture_progress_bar_value_changed(value: float) -> void:
	if value >= $TextureProgressBar.max_value:
		nivel += 1
		$TextureProgressBar.value = 0
		$TextureProgressBar/Label.text = str(nivel)
		$TextureProgressBar.value = $TextureProgressBar.max_value * 1.1
		$CPUParticles2D.emitting = true
