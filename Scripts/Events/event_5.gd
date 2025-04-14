extends Node2D

@onready var respons = $DialoguePanel/DialogueText

func gjemValg():
	$DecisionPanel/VBoxContainer.hide()
	$DecisionPanel/FerdigKnapp.show()

func _ready() -> void:
	respons.text = "O enestående leder, landet vårt er i en økonomisk krise. Hva skal vi gjøre?"

func _on_tax_button_pressed() -> void:
	Global.tax += 10
	Global.unrest += 10
	respons.text = "Du øker skattene. Dette forbedrer økonomien, men folket blir misfornøyd."
	gjemValg()

func _on_loan_button_pressed() -> void:
	Global.economy += 15
	Global.debt = true
	respons.text = "Du tar opp et lån fra utlandet. Dette forbedrer økonomien, men øker gjelden."
	gjemValg()

func _on_cut_spending_button_pressed() -> void:
	Global.economy += 5
	Global.unrest += 5
	if Global.socialServices > 0:
		Global.socialServices -= 1
	else:
		Global.uprising += 1
	respons.text = "Du kutter offentlige utgifter. Dette forbedrer økonomien, men folket blir misfornøyd."
	gjemValg()

func _on_print_money_button_pressed() -> void:
	Global.economy += 20
	Global.inflation = true
	respons.text = "Du trykker mer penger. Dette forbedrer økonomien kortsiktig, men øker inflasjonen."
	gjemValg()

func _on_ferdig_knapp_pressed() -> void:
	Global.eventDone = true
	self.queue_free()
