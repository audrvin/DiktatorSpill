extends Node2D

@onready var respons = $DialoguePanel/DialogueText

func gjemValg():
	$DecisionPanel/VBoxContainer.hide()
	$DecisionPanel/FerdigKnapp.show()

func _ready() -> void:
	respons.text = "O enestående leder, en naturkatastrofe har rammet landet. Hva skal vi gjøre?"

func _on_relief_button_pressed() -> void:
	if Global.economy > 10:
		Global.economy -= 10
		Global.unrest -= 10
		respons.text = "Du sender hjelp til de rammete områdene. Dette koster mye, men folket blir mindre urolig."
	else:
		respons.text = "Du har ikke nok økonomi til å sende hjelp. Folket blir enda mer misfornøyd."
	gjemValg()

func _on_ignore_button_pressed() -> void:
	Global.unrest += 15
	respons.text = "Du ignorerer naturkatastrofen. Dette gjør folket enda mer misfornøyd."
	gjemValg()

func _on_rebuild_button_pressed() -> void:
	Global.control -= 5
	Global.unrest -= 5
	respons.text = "Du starter gjenoppbyggingen av de ødelagte områdene. Dette gjør folket mindre urolig, men du mister litt kontroll."
	gjemValg()

func _on_declare_emergency_button_pressed() -> void:
	Global.control += 10
	Global.unrest += 5
	respons.text = "Du erklærer unntakstilstand og tar full kontroll. Dette øker din kontroll, men folket blir misfornøyd."
	gjemValg()

func _on_ferdig_knapp_pressed() -> void:
	Global.eventDone = true
	self.queue_free()
