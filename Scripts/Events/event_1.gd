extends Node2D

@onready var respons = $DialoguePanel/DialogueText

func gjemValg():
		$DecisionPanel/VBoxContainer.hide()
		$DecisionPanel/FerdigKnapp.show()

func _ready() -> void:
	respons.text = "O enestående leder, det er protester i gatene. 
	Innbyggerne forlanger større ytringsfrihet. Hva skal vi gjøre?"

#Decision button functions
func _on_supress_button_pressed() -> void:
	if (Global.enforcement + Global.tempEnforcement) > 5:
		Global.control += 5
		Global.unrest += 5
		respons.text = ("Du undertrykker protestene og får mer kontroll. 
		Befolkningen blir misfornøyd.")
	else: 
		Global.unrest += 5
		Global.control -= 5
		respons.text = ("Du forsøker å undertrykke protestene, men klarer ikke 
		å få situasjonen under kontroll. Du mister kontroll, 
		og befolkningen blir mer misfornøyd.")
	gjemValg()


func _on_allow_button_pressed() -> void:
	Global.control -= 5
	Global.unrest -= 5
	respons.text = ("Du tillater protestene. Befolkningen blir mindre urolig,
	men du mister litt av kontrollen din.")
	gjemValg()


func _on_surveil_button_pressed() -> void:
	respons.text = ("Du lar befolkningen protestere, men følger nøye med på hvem som
	leder protestene. Befolkningen blir litt mindre urolig, men du mister litt 
	av kontrollen din. Din etterretningsoffiser vil om kort tid ta kontakt med deg 
	om resultatene.")
	Global.control -= 5
	Global.unrest -= 5
	if Global.intelligence > 5:
		Global.foundProtestLeader = true
	gjemValg()


func _on_change_button_pressed() -> void:
	Global.control -= 20
	Global.unrest -= 10
	Global.fos += 30
	respons.text = ("Du går med på å gjøre endringer. Borgerne i landet har nå større
	ytringsfrihet. Borgerne blir glade, men du mister mye av din kontroll.")
	gjemValg()


func _on_ferdig_knapp_pressed() -> void:
	Global.eventDone = true
	self.queue_free()
