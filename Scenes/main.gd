extends Node2D

func _ready() -> void:
	$BackgroundMusic.play()

func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene()


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_music_h_slider_value_changed(value: float) -> void:
	$BackgroundMusic.volume_db = value


func _on_sfxh_slider_value_changed(value: float) -> void:
	pass # Replace with function body.
