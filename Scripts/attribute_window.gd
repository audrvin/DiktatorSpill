extends Node2D


func _on_confirm_button_pressed() -> void:
	self.hide()
	Global.valgtPoeng = true

func _process(_delta: float) -> void:
	if Global.startEventDone:
		$AttributePanel/MainContainer/MinusButtons.hide()
		$AttributePanel/MainContainer/PlusButtons.hide()
		$AttributePanel/ConfirmButton.hide()
	else:
		$AttributePanel/MainContainer/MinusButtons.show()
		$AttributePanel/MainContainer/PlusButtons.show()
		$AttributePanel/ConfirmButton.show()
