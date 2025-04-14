extends Node2D

@onready var ferdigKnapp = $DecisionPanel/FerdigKnapp
@onready var respons = $DialoguePanel/DialogueText
@onready var valg = $DecisionPanel/VBoxContainer

func _ready() -> void:
	respons.text = "Det er alltid viktig å ha militæret med seg. 
	Gjør det riktige valget, styrk militæret nå!  
	Hva sier du?"

func konkluder(): #Lukker handlingsalternativene og viser "ferdig"-knappen
	ferdigKnapp.show()
	valg.hide()


func _on_ferdig_knapp_pressed() -> void:
	Global.gamePhase += 1
	Global.phaseChange = true
	self.queue_free()


func _on_military_button_pressed() -> void:
	Global.economy -= 5
	Global.control += 5
	konkluder()


func _on_police_button_pressed() -> void:
	Global.economy -= 5
	Global.tempEnforcement += 3
	konkluder()


func _on_surveil_button_pressed() -> void:
	Global.economy -= 5
	konkluder()


func _on_save_button_pressed() -> void:
	konkluder()
