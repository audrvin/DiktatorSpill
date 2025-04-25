extends Node2D

func _ready() -> void:
	Global.gamePhase = 0 #Which of the four phases of the game the player is currently at variable gamePhase
	eventCheck()

func _process(_delta: float) -> void:
	if Global.phaseChange:
		eventCheck()
		Global.phaseChange = false

func eventCheck():
	if Global.gamePhase >= 3:
		phase3()
	elif Global.gamePhase == 2:
		phase2()
	elif Global.gamePhase == 1:
		phase1()
	elif Global.gamePhase == 0:
		phase0()

#Phase event functions
func phase0(): #First event in the cycle, resource allocation
	Global.styring = true
	add_child(startEvent)

func phase1(): #Second event in cycle, domestic policy choice
	add_child(civilEvent)

func phase2(): #Third event, military choice
	add_child(militaryEvent)

func phase3(): #Final event of cycle, random event
	if Global.eventDone == true:
		Global.gamePhase = 0
		Global.year += 1
		Global.startEventDone = false
		Global.eventDone = false
		budget()
	else:
		add_child(randomEvent)

#Special event that might occur based on global variables
func specialEvent():
	if Global.civilServantPlot:
		pass


#Define how economy is calculated at end of final phase
func budget():
	Global.economy -= 1#int(Global.education)
	Global.economy -= 1#int(Global.socialServices)
	Global.economy += 1#int(Global.tax)
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
