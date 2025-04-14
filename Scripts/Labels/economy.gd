extends Label

func _process(delta):
	self.text="Økonomi: " + str(Global.economy)
	if Global.economy < 25:
		self.add_theme_color_override("font_color", Color(255, 0, 0, 255))
	elif Global.economy < 50:
		self.add_theme_color_override("font_color", Color(255, 125, 0, 255))
	elif Global.economy < 75:
		self.add_theme_color_override("font_color", Color(135, 255, 0, 255))
	else:
		self.add_theme_color_override("font_color", Color(0, 255, 0, 255))
