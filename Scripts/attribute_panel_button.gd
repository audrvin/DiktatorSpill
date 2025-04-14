extends Button

func _process(_delta: float) -> void:
	pass

func _on_pressed() -> void:
	if Global.styring == true:
		$"../AttributeWindow".show()
		Global.styring = false
		self.hide()
