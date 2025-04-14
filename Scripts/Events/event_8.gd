extends Node2D

@onready var respons = $DialoguePanel/DialogueText

func gjemValg():
	$DecisionPanel/VBoxContainer.hide()
	$DecisionPanel/FerdigKnapp.show()

func _ready() -> void:
	respons.text = "O enestående leder, et terrorangrep har funnet sted i landet. Hva skal vi gjøre?"

func _on_investigate_button_pressed() -> void:
	if Global.intelligence > 5:
		Global.control += 5
		Global.unrest -= 5
		respons.text = "Du etterforsker angrepet og straffer de skyldige. Dette øker din kontroll og folket blir mindre urolig."
	else:
		respons.text = "Du klarer ikke å finne de skyldige. Folket blir misfornøyd."
	gjemValg()

func _on_retaliate_button_pressed() -> void:
	Global.control += 10
	Global.unrest += 10
	respons.text = "Du gjengjelder med et motangrep. Dette øker din kontroll, men folket blir misfornøyd."
	gjemValg()

func _on_support_button_pressed() -> void:
	Global.unrest -= 10
	respons.text = "Du støtter ofrene og deres familier. Dette gjør folket mindre urolig."
	gjemValg()

func _on_ignore_button_pressed() -> void:
	Global.unrest += 15
	respons.text = "Du ignorerer angrepet. Dette gjør folket enda mer misfornøyd."
	gjemValg()

func _on_ferdig_knapp_pressed() -> void:
	Global.eventDone = true
	self.queue_free()
