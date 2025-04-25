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
	print(Global.economy)
	respons.text = "Vi putter flere ressurser inn i militæret. Det koster penger, men det er verdt prisen!"
	konkluder()


func _on_police_button_pressed() -> void:
	Global.economy -= 5
	Global.tempEnforcement += 3
	respons.text = "Så du prioriterer politiet over militæret? Vi får se hvordan det går..."
	konkluder()


func _on_surveil_button_pressed() -> void:
	Global.economy -= 5
	Global.tempIntelligence += 3
	respons.text = "Overvåkning er ingenting sammenlignet med kuler og granater!"
	konkluder()


func _on_save_button_pressed() -> void:
	respons.text = "Javel, vi får snakkes til neste år."
	konkluder()
