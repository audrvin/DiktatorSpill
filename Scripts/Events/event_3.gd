extends Node2D

@onready var respons = $DialoguePanel/DialogueText

func gjemValg():
	$DecisionPanel/VBoxContainer.hide()
	$DecisionPanel/FerdigKnapp.show()

func _ready() -> void:
	respons.text = "O enestående leder, det er rapporter om korrupsjon blant dine embedsmenn. 
	Hva skal vi gjøre?"

func _on_investigate_button_pressed() -> void:
	if Global.intelligence > 5:
		Global.control += 10
		Global.unrest -= 5
		respons.text = "Du etterforsker korrupsjonen og straffer de skyldige. 
		Dette øker din kontroll og folket blir mindre urolig."
	else:
		respons.text = "Du klarer ikke å finne bevis for korrupsjon. 
		Folket blir misfornøyd."
		Global.unrest += 5
	gjemValg()

func _on_allow_button_pressed() -> void:
	Global.unrest += 10
	respons.text = "Du ignorerer rapporter om korrupsjon. 
	Embetsmennene er fornøyde, men folket blir misfornøyd."
	gjemValg()

func _on_bribe_button_pressed() -> void:
	if Global.economy > 5:
		Global.economy -= 5
		Global.control += 5
		respons.text = "Du bestikker embedsmennene for å holde dem lojale. 
		Dette koster, men øker din kontroll."
	else:
		respons.text = "Du har ikke nok økonomi til å bestikke embedsmennene. 
		Noen avslører at du også er korrupt, og folket blir misfornøyd."
		Global.unrest += 10
	gjemValg()

func _on_replace_button_pressed() -> void:
	Global.control += 5
	Global.economy -= 5
	Global.civilServantPlot = true
	respons.text = "Du erstatter de korrupte embedsmennene. 
	Dette koster deg litt penger, men du øker din kontroll."
	gjemValg()

func _on_ferdig_knapp_pressed() -> void:
	Global.phaseChange = true
	Global.eventDone = true
	self.queue_free()
