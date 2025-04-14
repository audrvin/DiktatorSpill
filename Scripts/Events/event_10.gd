extends Node2D

@onready var respons = $DialoguePanel/DialogueText

func gjemValg():
	$DecisionPanel/VBoxContainer.hide()
	$DecisionPanel/FerdigKnapp.show()

func _ready() -> void:
	respons.text = "O enestående leder, en pandemi har brutt ut i landet. Hva skal vi gjøre?"

func _on_quarantine_button_pressed() -> void:
	Global.control += 5
	Global.unrest += 5
	respons.text = "Du innfører karantene. Dette øker din kontroll, men folket blir misfornøyd."
	gjemValg()

func _on_vaccinate_button_pressed() -> void:
	if Global.economy > 10:
		Global.economy -= 10
		Global.unrest -= 10
		respons.text = "Du vaksinere befolkningen. Dette koster mye, men folket blir mindre urolig."
	else:
		respons.text = "Du har ikke nok økonomi til å vaksinere. Folket blir enda mer misfornøyd."
	gjemValg()

func _on_ignore_button_pressed() -> void:
	Global.unrest += 15
	respons.text = "Du ignorerer pandemien. Dette gjør folket enda mer misfornøyd."
	gjemValg()

func _on_inform_button_pressed() -> void:
	Global.unrest -= 5
	respons.text = "Du informerer befolkningen om hvordan de kan beskytte seg selv. Dette gjør folket mindre urolig."
	gjemValg()

func _on_ferdig_knapp_pressed() -> void:
	Global.eventDone = true
	self.queue_free()
