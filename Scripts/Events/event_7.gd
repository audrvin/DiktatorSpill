extends Node2D

@onready var respons = $DialoguePanel/DialogueText

func gjemValg():
	$DecisionPanel/VBoxContainer.hide()
	$DecisionPanel/FerdigKnapp.show()

func _ready() -> void:
	respons.text = "O enestående leder, internasjonalt press krever at du frigir politiske fanger. Hva skal vi gjøre?"

func _on_release_button_pressed() -> void:
	Global.control -= 5
	Global.unrest -= 10
	Global.international_relations += 10
	respons.text = "Du frigir de politiske fangene. Dette forbedrer de internasjonale relasjonene, men du mister litt kontroll."
	gjemValg()

func _on_deny_button_pressed() -> void:
	Global.international_relations -= 10
	respons.text = "Du nekter å friggi fangene. Dette forverrer de internasjonale relasjonene."
	gjemValg()

func _on_negotiate_button_pressed() -> void:
	Global.international_relations += 5
	respons.text = "Du forhandler med det internasjonale presset. Dette forbedrer de internasjonale relasjonene litt."
	gjemValg()

func _on_ignore_button_pressed() -> void:
	Global.international_relations -= 5
	respons.text = "Du ignorerer kravet. Dette forverrer de internasjonale relasjonene litt."
	gjemValg()

func _on_ferdig_knapp_pressed() -> void:
	Global.phaseChange = true
	Global.eventDone = true
	self.queue_free()
