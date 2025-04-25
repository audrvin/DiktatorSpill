extends Node2D

@onready var respons = $DialoguePanel/DialogueText

func gjemValg():
	$DecisionPanel/VBoxContainer.hide()
	$DecisionPanel/FerdigKnapp.show()

func _ready() -> void:
	respons.text = "O enestående leder, det er rapporter om et militærkupp. Hva skal vi gjøre?"

func _on_suppress_button_pressed() -> void:
	if Global.enforcement > 9:
		Global.control += 15
		Global.unrest += 10
		respons.text = "Du undertrykker kuppet med makt. Dette øker din kontroll, men folket blir misfornøyd."
	else:
		Global.militaryCoup = true
		respons.text = "Du klarer ikke å undertrykke kuppet. Militæret tar kontrollen over landet, og ditt styre er over."
	gjemValg()

func _on_negotiate_button_pressed() -> void:
	Global.control -= 10
	Global.unrest -= 10
	respons.text = "Du forhandler med kuppmakerne. Dette gjør folket mindre urolig, men du mister mye kontroll."
	gjemValg()

func _on_flee_button_pressed() -> void:
	Global.unrest = 0
	Global.flee = true
	respons.text = "Du flykter fra landet. Ditt styre er over."
	gjemValg()

func _on_support_button_pressed() -> void:
	if Global.diplomacy > 6:
		Global.control += 5
		Global.unrest -= 5
		respons.text = "Du får militær støtte fra et naboland. Dette hjelper deg å beholde kontrollen og folket blir mindre urolig."
	else:
		Global.militaryCoup = true
		respons.text = "Ingen land vil støtte deg. Folket blir misfornøyd."
	gjemValg()

func _on_ferdig_knapp_pressed() -> void:
	if Global.militaryCoup or Global.flee:
		Global.control=0
	else:
		Global.eventDone = true
		Global.phaseChange = true
	self.queue_free()
