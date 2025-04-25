#extends Node
#
#var eventNumber = 0
#
#var respons = "Hei"
#
##Event button functions
#func button1(eventNumber):
	#if eventNumber == 1:
		#event1option1()
	#if eventNumber == 2:
		#event2option1()
	#if eventNumber == 3:
		#event3option1()
	#if eventNumber == 4:
		#event4option1()
	#if eventNumber == 5:
		#event5option1()
	#if eventNumber == 6:
		#event6option1()
	#if eventNumber == 7:
		#event7option1()
	#if eventNumber == 8:
		#event8option1()
	#if eventNumber == 9:
		#event9option1()
	#if eventNumber == 10:
		#event10option1()
#func button2(eventNumber):
	#if eventNumber == 1:
		#event1option2()
	#if eventNumber == 2:
		#event2option2()
	#if eventNumber == 3:
		#event3option2()
	#if eventNumber == 4:
		#event4option2()
	#if eventNumber == 5:
		#event5option2()
	#if eventNumber == 6:
		#event6option2()
	#if eventNumber == 7:
		#event7option2()
	#if eventNumber == 8:
		#event8option2()
	#if eventNumber == 9:
		#event9option2()
	#if eventNumber == 10:
		#event10option2()
#func button3(eventNumber):
	#if eventNumber == 1:
		#event1option3()
	#if eventNumber == 2:
		#event2option3()
	#if eventNumber == 3:
		#event3option3()
	#if eventNumber == 4:
		#event4option3()
	#if eventNumber == 5:
		#event5option3()
	#if eventNumber == 6:
		#event6option3()
	#if eventNumber == 7:
		#event7option3()
	#if eventNumber == 8:
		#event8option3()
	#if eventNumber == 9:
		#event9option3()
	#if eventNumber == 10:
		#event10option3()
#func button4(eventNumber):
	#if eventNumber == 1:
		#event1option4()
	#if eventNumber == 2:
		#event2option4()
	#if eventNumber == 3:
		#event3option4()
	#if eventNumber == 4:
		#event4option4()
	#if eventNumber == 5:
		#event5option4()
	#if eventNumber == 6:
		#event6option4()
	#if eventNumber == 7:
		#event7option4()
	#if eventNumber == 8:
		#event8option4()
	#if eventNumber == 9:
		#event9option4()
	#if eventNumber == 10:
		#event10option4()
#
##Event 1
#var event1Text = "O enestående leder, det er protester i gatene. 
	#Innbyggerne forlanger større ytringsfrihet. Hva skal vi gjøre?" 
#var event1option1text = "Dette kan ikke aksepteres. Fengsle demonstrantene!"
#var event1option2text = "Det går vel bra med noen protester? Da føler de seg i alle fall hørt."
#var event1option3text = "La dem holde på, men følg nøye med på hvem som leder protestene!"
#var event1option4text = "Hvis befolkningen ønsker endring, må vi endre oss."
#func event1option1(): #Undertrykk
	#if (Global.enforcement + Global.tempEnforcement) > 5:
		#var respons1 = ("Du undertrykker protestene og får mer kontroll. 
		#Befolkningen blir misfornøyd.")
		#Global.control += 5
		#Global.unrest += 5
	#else: 
		#var respons1 = ("Du forsøker å undertrykke protestene, men klarer ikke 
		#å få situasjonen under kontroll. Du mister kontroll, 
		#og befolkningen blir mer misfornøyd.")
		#Global.unrest += 5
		#Global.control -= 5
#func event1option2(): #Tillat
	#var respons1 = ("Du tillater protestene. Befolkningen blir mindre urolig,
	#men du mister litt av kontrollen din.")
	#Global.control -= 5
	#Global.unrest -= 5
#func event1option3(): #Overvåk
	#var respons1 = ("Du lar befolkningen protestere, men følger nøye med på hvem som
	#leder protestene. Befolkningen blir litt mindre urolig, men du mister litt 
	#av kontrollen din. Din etterretningsoffiser vil om kort tid ta kontakt med deg 
	#om resultatene.")
	#Global.control -= 5
	#Global.unrest -= 5
	#if Global.intelligence > 5:
		#Global.foundProtestLeader = true
#func event1option4(): #Tilpass
	#var respons1 = ("Du går med på å gjøre endringer. Borgerne i landet har nå større
	#ytringsfrihet. Borgerne blir glade, men du mister mye av din kontroll.")
	#Global.control -= 20
	#Global.unrest -= 10
	#Global.fos += 30
#
##Event 2
#var event2Text = "O enestående leder, landet vårt lider av matmangel. Hva skal vi gjøre?"
#var event2option1text = "Rasjoner maten, slik at alle spiser litt mindre."
#var event2option2text = "Importer mat fra utlandet."
#var event2option3text = "Distribuer gratis mat til de fattigste."
#var event2option4text = "Ignorer problemet. Det går nok over snart!"
#func event2option1():
	#Global.economy += 5
	#Global.unrest += 10
	#respons.text = "Du innfører rasjonering av mat. 
	#Folket blir misfornøyd, men du sparer penger."
#func event2option2():
	#if Global.diplomacy > 5 and Global.economy >= 10:
		#Global.economy -= 10
		#Global.unrest -= 5
		#respons.text = "Du importerer mat fra utlandet. Dette koster mye, men folket blir mindre urolig."
	#elif Global.diplomacy < 6:
		#respons.text = "Du forsøker å handle med landene rundt deg, 
		#men ingen er villig til å dele ressurser med deg. 
		#Kanskje du burde bruke mere penger på diplomati?"
		#Global.unrest += 10
	#elif Global.economy < 10:
		#respons.text = "Du har ikke nok penger til å importere mat. Folket blir enda mer misfornøyd."
		#Global.unrest += 10
#func event2option3():
	#if Global.economy >= 5:
		#Global.control -= 5
		#Global.unrest -= 10
		#Global.economy -= 5
		#respons.text = "Du distribuerer mat gratis til de fattigste. 
		#Dette gjør folket mindre urolig, men koster deg litt penger."
	#else: 
		#respons.text = "Du har ikke nok penger til å dele ut mat. 
		#Folket blir mer misfornøyd."
		#Global.unrest += 5
#func event2option4():
	#Global.unrest += 15
	#respons.text = "Du ignorerer problemet. Folket blir enda mer misfornøyd."
#
##Event 3
#var event3Text = "O enestående leder, det er rapporter om korrupsjon blant dine embedsmenn. 
	#Hva skal vi gjøre?"
#var event3option1text = "Etterforsk saken og straff dem det gjelder."
#var event3option2text = "Tillat korrupsjonen. Det gjør nok embetsmennene fornøyde."
#var event3option3text = "Så lenge de er lojale til meg, er alt vel. Bestikk embedsmennene!"
#var event3option4text = "Gi embetsmennene sparken, og ansett nye, lojale embetsmenn."
#func event3option1():
	#if Global.intelligence > 5:
		#Global.control += 10
		#Global.unrest -= 5
		#respons.text = "Du etterforsker korrupsjonen og straffer de skyldige. 
		#Dette øker din kontroll og folket blir mindre urolig."
	#else:
		#respons.text = "Du klarer ikke å finne bevis for korrupsjon. 
		#Folket blir misfornøyd."
		#Global.unrest += 5
#func event3option2():
	#Global.unrest += 10
	#respons.text = "Du ignorerer rapporter om korrupsjon. 
	#Embetsmennene er fornøyde, men folket blir misfornøyd."
#func event3option3():
	#if Global.economy > 5:
		#Global.economy -= 5
		#Global.control += 5
		#respons.text = "Du bestikker embedsmennene for å holde dem lojale. 
		#Dette koster, men øker din kontroll."
	#else:
		#respons.text = "Du har ikke nok økonomi til å bestikke embedsmennene. 
		#Noen avslører at du også er korrupt, og folket blir misfornøyd."
		#Global.unrest += 10
#func event3option4():
	#Global.control += 5
	#Global.economy -= 5
	#Global.civilServantPlot = true
	#respons.text = "Du erstatter de korrupte embedsmennene. 
	#Dette koster deg litt penger, men du øker din kontroll."
#
##Event 4
#var event4Text = "O enestående leder, en naturkatastrofe har rammet landet. Hva skal vi gjøre?"
#var event4option1text = "De som er rammet må få hjelp. Umiddelbart!"
#var event4option2text = "Slikt skjer. Det er ikke noe å gjøre med det nå."
#var event4option3text = "Dette er en fin mulighet til å gjenreise nasjonen! Alle bygg som raser skal reises igjen enda praktigere!"
#var event4option4text = "Desperate situasjonen krever kraftige tiltak. Erklær unntakstilstand med en gang!"
#func event4option1():
	#if Global.economy > 10:
		#Global.economy -= 10
		#Global.unrest -= 10
		#respons.text = "Du sender hjelp til de rammete områdene. Dette koster mye, men folket blir mindre urolig."
	#else:
		#respons.text = "Du har ikke nok økonomi til å sende hjelp. Folket blir enda mer misfornøyd."
#func event4option2():
	#Global.unrest += 15
	#respons.text = "Du ignorerer naturkatastrofen. Dette gjør folket enda mer misfornøyd."
#func event4option3():
	#Global.control -= 5
	#Global.unrest -= 5
	#respons.text = "Du starter gjenoppbyggingen av de ødelagte områdene. Dette gjør folket mindre urolig, men du mister litt kontroll."
#func event4option4():
	#Global.control += 10
	#Global.unrest += 5
	#respons.text = "Du erklærer unntakstilstand og tar full kontroll. Dette øker din kontroll, men folket blir misfornøyd."
#
##Event 5
#var event5Text = "O enestående leder, landet vårt er i en økonomisk krise. Hva skal vi gjøre?"
#var event5option1text = "Vi trenger mere penger! Øk skattene!"
#var event5option2text = "En av våre allierte kan vel hjelpe oss? Be om et lån."
#var event5option3text = "Innbyggerne må klare seg med færre sosiale tjenester, slik sparer vi penger."
#var event5option4text = "Da får vi trykke flere penger. Start pressen!"
#func event5option1():
	#Global.tax += 10
	#Global.unrest += 10
	#respons.text = "Du øker skattene. Dette forbedrer økonomien, men folket blir misfornøyd."
#func event5option2():
	#Global.economy += 15
	#Global.debt = true
	#respons.text = "Du tar opp et lån fra utlandet. Dette forbedrer økonomien, men øker gjelden."
#func event5option3():
	#Global.economy += 5
	#Global.unrest += 5
	#if Global.socialServices > 0:
		#Global.socialServices -= 1
	#else:
		#Global.uprising += 1
	#respons.text = "Du kutter offentlige utgifter. Dette forbedrer økonomien, men folket blir misfornøyd."
#func event5option4():
	#Global.economy += 20
	#Global.inflation = true
	#respons.text = "Du trykker mer penger. Dette forbedrer økonomien kortsiktig, men øker inflasjonen."
#
##Event 6
#var event6Text = "O enestående leder, et opprør har brutt ut i hovedstaden. Hva skal vi gjøre?"
#var event6option1text = "At de våger! Send politiet på saken!!"
#var event6option2text = "Inviter lederne av opprøret til forhandlinger. Vi skal nok finne ut av dette."
#var event6option3text = "Så tvil hos befolkningen. De skal ikke skjønne hva som er sant eller ikke."
#var event6option4text = "Det er alltids lurt å lytte. Det kan jo hende de har noen gode poeng."
#func event6option1():
	#if Global.enforcement > 6:
		#Global.control += 10
		#Global.unrest += 10
		#var respons6 = "Du undertrykker opprøret med makt. Dette øker din kontroll, men folket blir misfornøyd."
	#else:
		#var respons6 = "Du klarer ikke å undertrykke opprøret. Folket blir enda mer misfornøyd."
		#Global.unrest += 10
#func event6option2():
	#Global.control -= 5
	#Global.unrest -= 10
	#respons.text = "Du forhandler med opprørerne. Dette gjør folket mindre urolig, men du mister litt kontroll."
#func event6option3():
	#if Global.propaganda > 5:
		#Global.unrest -= 5
		#respons.text = "Du bruker propaganda for å vinne folket på din side. Dette gjør folket mindre urolig."
	#else:
		#respons.text = "Propagandaen din er ikke effektiv. Folket blir misfornøyd."
		#Global.unrest += 5
#func event6option4():
	#Global.control -= 10
	#Global.unrest -= 15
	#respons.text = "Du går med på noen av opprørernes krav. Dette gjør folket mindre urolig, men du mister mye kontroll."
#
##Event 7
#var event7Text = "O enestående leder, internasjonalt press krever at du frigir politiske fanger. Hva skal vi gjøre?"
#
#var event7option1text = "Vi kan ikke risikere å få verdenssamfunnet mot oss. Slipp fangene fri."
#var event7option2text = "Fangene er forbrytere og dømt etter loven. De forblir i fengsel!"
#var event7option3text = "De andre landene har misforstått. Send noen diplomater for å forklare saken."
#var event7option4text = "Hvis vi bare sitter stille i båten kommer dette til å gå over av seg selv. Vi trenger ikke gjøre noe."
#
#func event7option1():
	#Global.control -= 5
	#Global.unrest -= 10
	#Global.internationalRelations = true
	#respons.text = "Du frigir de politiske fangene. Dette forbedrer de internasjonale relasjonene, men du mister litt kontroll."
#
#func event7option2():
	#respons.text = "Du nekter å friggi fangene. Dette forverrer de internasjonale relasjonene. Det blir innført sanksjoner mot deg, og økonomien forverres."
	#Global.internationalRelations = false
	#Global.economy -= 10
#
#func event7option3():
	#if Global.diplomacy > 5:
		#respons.text = "Du forhandler med det internasjonale presset. Dette forbedrer de internasjonale relasjonene litt."
		#Global.internationalRelations = true
	#else:
		#respons.text = "Forhandlingene går ikke etter planen, og det blir innført sanksjoner mot deg. Økonomien forverres."
		#Global.economy -= 5
#
#func event7option4():
	#respons.text = "Du ignorerer kravet. Dette forverrer de internasjonale relasjonene litt."
	#Global.internationalRelations = false
	#Global.economy -= 10
#
##Event 8
#var event8Text = "O enestående leder, et terrorangrep har funnet sted i landet. Hva skal vi gjøre?"
#
#var event8option1text = "Finn ut av hvem som er skyldig, fort!"
#var event8option2text = "Blod for blod. Send militæret og luk dem ut. Koste hva det koste vil!"
#var event8option3text = "Vi må samle folket i denne sorgen. Finn frem blomster og stearinlys."
#var event8option4text = "Vi får ikke gjort noe med dette nå. Det blir nok snart glemt, uansett."
#
#func event8option1():
	#if Global.intelligence > 5:
		#Global.control += 5
		#Global.unrest -= 5
		#respons.text = "Du etterforsker angrepet og straffer de skyldige. Dette øker din kontroll og folket blir mindre urolig."
	#else:
		#respons.text = "Du klarer ikke å finne de skyldige. Folket blir misfornøyd."
		#Global.unrest += 5
#
#func event8option2():
	#Global.control += 10
	#Global.unrest += 10
	#respons.text = "Du gjengjelder med et motangrep. Dette øker din kontroll, men folket blir misfornøyd."
#
#func event8option3():
	#Global.unrest -= 10
	#respons.text = "Du støtter ofrene og deres familier. Dette gjør folket mindre urolig."
#
#func event8option4():
	#Global.unrest += 15
	#respons.text = "Du ignorerer angrepet. Dette gjør folket enda mer misfornøyd."
#
##Event 9
#var event9Text = "O enestående leder, det er rapporter om et militærkupp. Hva skal vi gjøre?"
#
#var event9option1text = "De som er rammet må få hjelp. Umiddelbart!"
#var event9option2text = "Slikt skjer. Det er ikke noe å gjøre med det nå."
#var event9option3text = "Dette er en fin mulighet til å gjenreise nasjonen! Alle bygg som raser skal reises igjen enda praktigere!"
#var event9option4text = "Desperate situasjonen krever kraftige tiltak. Erklær unntakstilstand med en gang!"
#
#func event9option1():
	#if Global.enforcement > 15:
		#Global.control += 15
		#Global.unrest += 10
		#respons.text = "Du undertrykker kuppet med makt. Dette øker din kontroll, men folket blir misfornøyd."
	#else:
		#respons.text = "Du klarer ikke å undertrykke kuppet. Folket blir enda mer misfornøyd."
#
#func event9option2():
	#Global.control -= 10
	#Global.unrest -= 10
	#respons.text = "Du forhandler med kuppmakerne. Dette gjør folket mindre urolig, men du mister mye kontroll."
#
#func event9option3():
	#Global.control = 0
	#Global.unrest = 0
	#respons.text = "Du flykter fra landet. Dette avslutter spillet."
#
#func event9option4():
	#if Global.international_relations > 10:
		#Global.control += 5
		#Global.unrest -= 5
		#respons.text = "Du søker internasjonal støtte. Dette hjelper deg å beholde kontrollen og folket blir mindre urolig."
	#else:
		#respons.text = "Ingen land vil støtte deg. Folket blir misfornøyd."
#
##Event 10
#var event10Text = "O enestående leder, en pandemi har brutt ut i landet. Hva skal vi gjøre?"
#
#var event10option1text = "De som er rammet må få hjelp. Umiddelbart!"
#var event10option2text = "Slikt skjer. Det er ikke noe å gjøre med det nå."
#var event10option3text = "Dette er en fin mulighet til å gjenreise nasjonen! Alle bygg som raser skal reises igjen enda praktigere!"
#var event10option4text = "Desperate situasjonen krever kraftige tiltak. Erklær unntakstilstand med en gang!"
#
#func event10option1():
	#Global.control += 5
	#Global.unrest += 5
	#respons.text = "Du innfører karantene. Dette øker din kontroll, men folket blir misfornøyd."
#
#func event10option2():
	#if Global.economy > 10:
		#Global.economy -= 10
		#Global.unrest -= 10
		#respons.text = "Du vaksinere befolkningen. Dette koster mye, men folket blir mindre urolig."
	#else:
		#respons.text = "Du har ikke nok økonomi til å vaksinere. Folket blir enda mer misfornøyd."
#
#func event10option3():
	#Global.unrest += 15
	#respons.text = "Du ignorerer pandemien. Dette gjør folket enda mer misfornøyd."
#
#func event10option4():
	#Global.unrest -= 5
	#respons.text = "Du informerer befolkningen om hvordan de kan beskytte seg selv. Dette gjør folket mindre urolig."
