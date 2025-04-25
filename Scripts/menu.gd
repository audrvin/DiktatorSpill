extends Panel

var menuOpen = false

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Menu"):
		if menuOpen:
			menuOpen = false
			self.hide()
			$"../../EventHandler".show()
			$"../UIPanelTop".show()
		else:
			menuOpen = true
			self.show()
			$"../../EventHandler".hide()
			$"../UIPanelTop".hide()
