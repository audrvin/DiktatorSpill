extends Node2D

@onready var respons = $DialoguePanel/DialogueText

func gjemValg():
		$DecisionPanel/VBoxContainer.hide()
		$DecisionPanel/FerdigKnapp.show()

func _ready() -> void:
	if GE.eventNumber == 1:
		$DialoguePanel/DialogueText.text = GE.event1Text
		$DecisionPanel/ActionButtonContainer/Action1Button.text = str(Global.event1option1text)
		$DecisionPanel/ActionButtonContainer/Action2Button.text = str(Global.event1option2text)
		$DecisionPanel/ActionButtonContainer/Action3Button.text = str(Global.event1option3text)
		$DecisionPanel/ActionButtonContainer/Action4Button.text = str(Global.event1option4text)
	if GE.eventNumber == 2:
		$DialoguePanel/DialogueText.text = GE.event2Text
		$DecisionPanel/ActionButtonContainer/Action1Button.text = str(Global.event2option1text)
		$DecisionPanel/ActionButtonContainer/Action2Button.text = str(Global.event2option2text)
		$DecisionPanel/ActionButtonContainer/Action3Button.text = str(Global.event2option3text)
		$DecisionPanel/ActionButtonContainer/Action4Button.text = str(Global.event2option4text)
	if GE.eventNumber == 3:
		$DialoguePanel/DialogueText.text = GE.event3Text
		$DecisionPanel/ActionButtonContainer/Action1Button.text = str(Global.event3option1text)
		$DecisionPanel/ActionButtonContainer/Action2Button.text = str(Global.event3option2text)
		$DecisionPanel/ActionButtonContainer/Action3Button.text = str(Global.event3option3text)
		$DecisionPanel/ActionButtonContainer/Action4Button.text = str(Global.event3option4text)
	if GE.eventNumber == 4:
		$DialoguePanel/DialogueText.text = GE.event4Text
		$DecisionPanel/ActionButtonContainer/Action1Button.text = str(Global.event4option1text)
		$DecisionPanel/ActionButtonContainer/Action2Button.text = str(Global.event4option2text)
		$DecisionPanel/ActionButtonContainer/Action3Button.text = str(Global.event4option3text)
		$DecisionPanel/ActionButtonContainer/Action4Button.text = str(Global.event4option4text)
	if GE.eventNumber == 5:
		$DialoguePanel/DialogueText.text = GE.event5Text
		$DecisionPanel/ActionButtonContainer/Action1Button.text = str(Global.event5option1text)
		$DecisionPanel/ActionButtonContainer/Action2Button.text = str(Global.event5option2text)
		$DecisionPanel/ActionButtonContainer/Action3Button.text = str(Global.event5option3text)
		$DecisionPanel/ActionButtonContainer/Action4Button.text = str(Global.event5option4text)
	if GE.eventNumber == 6:
		$DialoguePanel/DialogueText.text = GE.event6Text
		$DecisionPanel/ActionButtonContainer/Action1Button.text = GE.event6option1text
		$DecisionPanel/ActionButtonContainer/Action2Button.text = GE.event6option2text
		$DecisionPanel/ActionButtonContainer/Action3Button.text = GE.event6option3text
		$DecisionPanel/ActionButtonContainer/Action4Button.text = GE.event6option4text
	if GE.eventNumber == 7:
		$DialoguePanel/DialogueText.text = GE.event7Text
		$DecisionPanel/ActionButtonContainer/Action1Button.text = str(Global.event7option1text)
		$DecisionPanel/ActionButtonContainer/Action2Button.text = str(Global.event7option2text)
		$DecisionPanel/ActionButtonContainer/Action3Button.text = str(Global.event7option3text)
		$DecisionPanel/ActionButtonContainer/Action4Button.text = str(Global.event7option4text)
	if GE.eventNumber == 8:
		$DialoguePanel/DialogueText.text = GE.event8Text
		$DecisionPanel/ActionButtonContainer/Action1Button.text = str(Global.event8option1text)
		$DecisionPanel/ActionButtonContainer/Action2Button.text = str(Global.event8option2text)
		$DecisionPanel/ActionButtonContainer/Action3Button.text = str(Global.event8option3text)
		$DecisionPanel/ActionButtonContainer/Action4Button.text = str(Global.event8option4text)
	if GE.eventNumber == 9:
		$DialoguePanel/DialogueText.text = GE.event9Text
		$DecisionPanel/ActionButtonContainer/Action1Button.text = str(Global.event9option1text)
		$DecisionPanel/ActionButtonContainer/Action2Button.text = str(Global.event9option2text)
		$DecisionPanel/ActionButtonContainer/Action3Button.text = str(Global.event9option3text)
		$DecisionPanel/ActionButtonContainer/Action4Button.text = str(Global.event9option4text)
	if GE.eventNumber == 10:
		$DialoguePanel/DialogueText.text = GE.event10Text
		$DecisionPanel/ActionButtonContainer/Action1Button.text = str(Global.event10option1text)
		$DecisionPanel/ActionButtonContainer/Action2Button.text = str(Global.event10option2text)
		$DecisionPanel/ActionButtonContainer/Action3Button.text = str(Global.event10option3text)
		$DecisionPanel/ActionButtonContainer/Action4Button.text = str(Global.event10option4text)

func _on_button1_pressed() -> void:
	GE.button1(GE.eventNumber)
	respons.text = GE.respons6
	gjemValg()


func _on_button2_pressed() -> void:
	GE.button2(GE.eventNumber)
	gjemValg()


func _on_button3_pressed() -> void:
	GE.button3(GE.eventNumber)
	gjemValg()


func _on_button4_pressed() -> void:
	GE.button4(GE.eventNumber)
	gjemValg()
 

func _on_done_button_pressed() -> void:
	Global.gamePhase += 1
	Global.phaseChange = true
	self.queue_free()
