extends Label

func _process(_delta):
	self.text = "AP: " + str(Global.ap)
