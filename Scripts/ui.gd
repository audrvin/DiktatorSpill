extends Node2D

@onready var statBox = $UIPanelTop/StatBoxToggleButton/PanelContainer

func _process(_delta: float) -> void:
	game_over()

func game_over():
	if Global.control < Global.unrest or Global.control < 1:
		$GameOverScreen.show()
		$UI.hide()


func _on_stat_box_toggle_button_pressed() -> void:
	if statBox.visible:
		statBox.hide()
	else:
		statBox.show()


func _on_attribute_view_button_pressed() -> void:
	if $UIPanelTop/AttributeWindow.visible:
		$UIPanelTop/AttributeWindow.hide()
	else:
		$UIPanelTop/AttributeWindow.show()


func _on_stat_test_pressed() -> void:
	print(Global.enforcement)
	print(Global.tempEnforcement)
