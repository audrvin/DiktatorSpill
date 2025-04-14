extends Node2D

@onready var respons = $DialoguePanel/DialogueText

func gjemValg():
	$DecisionPanel/VBoxContainer.hide()
	$DecisionPanel/FerdigKnapp.show()

func _ready() -> void:
	respons.text = "O enestående leder, landet vårt lider av matmangel. Hva skal vi gjøre?"

func _on_ration_button_pressed() -> void:
	Global.economy += 5
	Global.unrest += 10
	respons.text = "Du innfører rasjonering av mat. 
	Folket blir misfornøyd, men du sparer penger."
	gjemValg()

func _on_import_button_pressed() -> void:
	if Global.diplomacy > 5 and Global.economy >= 10:
		Global.economy -= 10
		Global.unrest -= 5
		respons.text = "Du importerer mat fra utlandet. Dette koster mye, men folket blir mindre urolig."
	elif Global.diplomacy < 6:
		respons.text = "Du forsøker å handle med landene rundt deg, 
		men ingen er villig til å dele ressurser med deg. 
		Kanskje du burde bruke mere penger på diplomati?"
		Global.unrest += 10
	elif Global.economy < 10:
		respons.text = "Du har ikke nok penger til å importere mat. Folket blir enda mer misfornøyd."
		Global.unrest += 10
	gjemValg()

func _on_distribute_button_pressed() -> void:
	if Global.economy >= 5:
		Global.control -= 5
		Global.unrest -= 10
		Global.economy -= 5
		respons.text = "Du distribuerer mat gratis til de fattigste. 
		Dette gjør folket mindre urolig, men koster deg litt penger."
	else: 
		respons.text = "Du har ikke nok penger til å dele ut mat. 
		Folket blir mer misfornøyd."
		Global.unrest += 5
	gjemValg()

func _on_ignore_button_pressed() -> void:
	Global.unrest += 15
	respons.text = "Du ignorerer problemet. Folket blir enda mer misfornøyd."
	gjemValg()

func _on_ferdig_knapp_pressed() -> void:
	Global.eventDone = true
	self.queue_free()
