extends Node

#Game stage control
var styring = false
var tutorialDone = false
var valgtPoeng = false
var gamePhase = 0
var phaseChange = false

#Date
var year = 2025
var date = "1. januar, " + str(year)


#Scores
var control = 74 #0 = Game over, din evne til å undertrykke folket
var unrest = 51 #Hvor misfornøyde befolkningen er
var economy = 100
var fos = 20 #Freedom of Speech
var tax = 80


#Attributes
var enforcement = 0
var propaganda = 0
var intelligence = 0
var diplomacy = 0
var socialServices = 0
var infrastructure = 0
var ap = 20 #unallocated attribute point

#Temporary attributes
var tempEnforcement = 0
var tempPropaganda = 0
var tempIntelligence = 0
var tempDiplomacy = 0
var tempSocialServices = 0
var tempInfrastructure = 0
var tempStats = [tempEnforcement,tempPropaganda,tempIntelligence,tempDiplomacy,tempSocialServices,tempInfrastructure]

#Events
var civil_action
var military_action

#Standard events
var startEventDone = false
var eventDone = false

#Spesielle hendelser
var foundProtestLeader = false
var civilServantPlot = false
var ignoredMilitary = 0
var debt = false
var uprising = 0
var inflation = false
var internationalRelations = false
