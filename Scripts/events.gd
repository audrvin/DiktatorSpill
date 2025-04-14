extends Node2D

func _ready() -> void:
	Global.gamePhase = 0
	game_phase()

func _process(_delta: float) -> void:
	if Global.phaseChange == true:
		game_phase()
		Global.phaseChange = false

func game_phase():
	if Global.gamePhase >= 3:
		phase3()
	elif Global.gamePhase == 2:
		phase2()
	elif Global.gamePhase == 1:
		phase1()
	elif Global.gamePhase == 0:
		phase0()

func phase3():
	if Global.eventDone == true:
		Global.gamePhase = 0
		Global.year += 1
		Global.startEventDone = false
		Global.eventDone = false
		budget()
	else:
		add_child(randomEvent)

func phase2():
	add_child(militaryEvent)

func phase1():
	add_child(civilEvent)

func phase0():
	Global.styring = true
	add_child(startEvent)

#Spesielle hendelser som kan inntre utifra tidligere valg
func specialEvent():
	if Global.civilServantPlot:
		pass


#Definer hvordan pengebruk og inntekter beregnes ved slutten av året
func budget():
	Global.economy -= Global.education 
	Global.economy -= Global.socialServices 
	Global.economy += Global.tax
	for i in Global.tempStats:
		i = 0


#ONREADY
@onready var startEvent = preload("res://Scenes/PhaseEvents/startEvent.tscn").instantiate()
@onready var civilEvent = preload("res://Scenes/PhaseEvents/sivil_handling.tscn").instantiate()
@onready var militaryEvent = preload("res://Scenes/PhaseEvents/militær_handling.tscn").instantiate()

#Standard events
@onready var event1 = preload("res://Scenes/Events/Event1.tscn").instantiate()
@onready var event2 = preload("res://Scenes/Events/Event2.tscn").instantiate()
@onready var event3 = preload("res://Scenes/Events/Event3.tscn").instantiate()
@onready var event4 = preload("res://Scenes/Events/Event4.tscn").instantiate()
@onready var event5 = preload("res://Scenes/Events/Event5.tscn").instantiate()
@onready var event6 = preload("res://Scenes/Events/Event6.tscn").instantiate()
@onready var event7 = preload("res://Scenes/Events/Event7.tscn").instantiate()
@onready var event8 = preload("res://Scenes/Events/Event8.tscn").instantiate()
@onready var event9 = preload("res://Scenes/Events/Event9.tscn").instantiate()
@onready var event10 = preload("res://Scenes/Events/Event10.tscn").instantiate()

@onready var eventList = [event1, event2, event3, event4, event5, event6, event7, event8, event9, event10]
@onready var randomEvent = eventList[randi_range(0,9)]

#Spesielle events
