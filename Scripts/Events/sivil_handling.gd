extends Node2D

@onready var ferdigKnapp = $DecisionPanel/FerdigKnapp
@onready var respons = $DialoguePanel/DialogueText
@onready var valg = $DecisionPanel/VBoxContainer

func _ready() -> void:
	respons.text = "Vi har muligheten til å gjøre noen tiltak for å styrke kontrollen din innad i landet.
	Jeg har kommet opp med noen forslag. Vi kan igangsette overvåking av befolkningen, 
	eller vi kan enkelt og greit bare spørre dem om hva de ønsker seg.  
	Hva synes du?"

func konkluder(): #Lukker handlingsalternativene og viser "ferdig"-knappen
	ferdigKnapp.show()
	valg.hide()


func _on_ferdig_knapp_pressed() -> void:
	Global.gamePhase += 1
	Global.phaseChange = true
	self.queue_free()


func _on_spy_button_pressed() -> void:
	konkluder()


func _on_survey_button_pressed() -> void:
	konkluder()


func _on_surveil_button_pressed() -> void:
	konkluder()


func _on_diplomacy_button_pressed() -> void:
	konkluder()
