extends Node2D

@onready var respons = $DialoguePanel/DialogueText

func gjemValg():
	$DecisionPanel/VBoxContainer.hide()
	$DecisionPanel/FerdigKnapp.show()

func _ready() -> void:
	respons.text = "O enestående leder, et opprør har brutt ut i hovedstaden. Hva skal vi gjøre?"

func _on_suppress_button_pressed() -> void:
	if Global.enforcement > 10:
		Global.control += 10
		Global.unrest += 10
		respons.text = "Du undertrykker opprøret med makt. Dette øker din kontroll, men folket blir misfornøyd."
	else:
		respons.text = "Du klarer ikke å undertrykke opprøret. Folket blir enda mer misfornøyd."
	gjemValg()

func _on_negotiate_button_pressed() -> void:
	Global.control -= 5
	Global.unrest -= 10
	respons.text = "Du forhandler med opprørerne. Dette gjør folket mindre urolig, men du mister litt kontroll."
	gjemValg()

func _on_propaganda_button_pressed() -> void:
	if Global.propaganda > 5:
		Global.unrest -= 5
		respons.text = "Du bruker propaganda for å vinne folket på din side. Dette gjør folket mindre urolig."
	else:
		respons.text = "Propagandaen din er ikke effektiv. Folket blir misfornøyd."
		Global.unrest += 5
	gjemValg()

func _on_concessions_button_pressed() -> void:
	Global.control -= 10
	Global.unrest -= 15
	respons.text = "Du går med på noen av opprørernes krav. Dette gjør folket mindre urolig, men du mister mye kontroll."
	gjemValg()

func _on_ferdig_knapp_pressed() -> void:
	Global.eventDone = true
	self.queue_free()
