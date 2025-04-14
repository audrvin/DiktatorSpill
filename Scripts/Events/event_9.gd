extends Node2D

@onready var respons = $DialoguePanel/DialogueText

func gjemValg():
	$DecisionPanel/VBoxContainer.hide()
	$DecisionPanel/FerdigKnapp.show()

func _ready() -> void:
	respons.text = "O enestående leder, det er rapporter om et militærkupp. Hva skal vi gjøre?"

func _on_suppress_button_pressed() -> void:
	if Global.enforcement > 15:
		Global.control += 15
		Global.unrest += 10
		respons.text = "Du undertrykker kuppet med makt. Dette øker din kontroll, men folket blir misfornøyd."
	else:
		respons.text = "Du klarer ikke å undertrykke kuppet. Folket blir enda mer misfornøyd."
	gjemValg()

func _on_negotiate_button_pressed() -> void:
	Global.control -= 10
	Global.unrest -= 10
	respons.text = "Du forhandler med kuppmakerne. Dette gjør folket mindre urolig, men du mister mye kontroll."
	gjemValg()

func _on_flee_button_pressed() -> void:
	Global.control = 0
	Global.unrest = 0
	respons.text = "Du flykter fra landet. Dette avslutter spillet."
	gjemValg()

func _on_seek_support_button_pressed() -> void:
	if Global.international_relations > 10:
		Global.control += 5
		Global.unrest -= 5
		respons.text = "Du søker internasjonal støtte. Dette hjelper deg å beholde kontrollen og folket blir mindre urolig."
	else:
		respons.text = "Ingen land vil støtte deg. Folket blir misfornøyd."
	gjemValg()

func _on_ferdig_knapp_pressed() -> void:
	Global.eventDone = true
	self.queue_free()
