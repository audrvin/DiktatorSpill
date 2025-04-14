extends Node2D

@onready var respons = $DialoguePanel/DialogueText
@onready var valg = $DecisionPanel/Valg
@onready var ferdigKnapp = $DecisionPanel/FerdigKnapp

func choice():
		$DecisionPanel.hide()

func _ready() -> void:
	respons.text = "O enestående leder, et nytt år med nye muligheter ligger forran oss.
	Hvordan skal vi fordele ressursene våre for å best sikre at vi ikke mister makten?
	Trykk på knappen ´Ressurser´ i øvre høyre hjørne for å distribuere ressursene dine!"

func _process(_delta: float) -> void:
	if Global.valgtPoeng == true and Global.tutorialDone == false:
		leftover_ap()



#Event functions

#Sjekker om spilleren har brukt all AP eller ikke
func leftover_ap():
	if Global.ap > 0:
		respons.text = "O store leder, du har ikke fordelt alle ressursene. 
		Er du sikker på at du vil gi deg med dette?"
		valg.show()
	else:
		respons.text = "Flott! Alle ressursene våre er allokert! Da er det bare å 
		lene seg tilbake og nyte makten."
		ferdigKnapp.show()


#Valgknapp funksjoner
func _on_ja_button_pressed() -> void:
	respons.text = "Du har ikke allokert alle ressursene, men du får en ny mulighet neste år!"
	valg.hide()
	Global.tutorialDone = true
	ferdigKnapp.show()


func _on_nei_button_pressed() -> void:
	Global.valgtPoeng = false
	valg.hide()


func _on_ferdig_knapp_pressed() -> void:
	Global.startEventDone = true
	Global.gamePhase += 1
	Global.phaseChange = true
	self.queue_free()
	
