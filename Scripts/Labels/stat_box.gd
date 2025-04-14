extends VBoxContainer

#ONREADIES
@onready var eco = Global.economy
@onready var con = Global.control
@onready var un = Global.unrest
@onready var tax = Global.tax

func _process(_delta: float) -> void:
#Update stat box label values
	$Economy.text="Økonomi: " + str(eco)
	$Control.text="Kontroll: " + str(con)
	$Unrest.text="Misnøye: " + str(un)
	$Tax.text="Skatt: " + str(tax) + "%"

#Set label font size to 32
	for i in [$Economy, $Control, $Unrest, $Tax]:
		i.add_theme_font_size_override("font_size", 32)

#Update label colors
	update_con()
	update_eco()
	update_tax()
	update_un()


#Update color functions
func update_eco():
	if eco < 25:
		$Economy.add_theme_color_override("font_color", red)
	elif eco < 50:
		$Economy.add_theme_color_override("font_color", orange) #ORANGE COLOR
	elif eco < 75:
		$Economy.add_theme_color_override("font_color", lGreen) #LIGHT GREEN
	else:
		$Economy.add_theme_color_override("font_color", green) #DEEP GREEN

func update_con():
	if con < 25:
		$Control.add_theme_color_override("font_color", red)
	elif con < 50:
		$Control.add_theme_color_override("font_color", orange)
	elif con < 75:
		$Control.add_theme_color_override("font_color", lGreen)
	else:
		$Control.add_theme_color_override("font_color", green)
		
func update_un():
	if un > 75:
		$Unrest.add_theme_color_override("font_color", red)
	elif un > 50:
		$Unrest.add_theme_color_override("font_color", orange)
	elif un > 25:
		$Unrest.add_theme_color_override("font_color", lGreen)
	else:
		$Unrest.add_theme_color_override("font_color", green)

func update_tax():
	if tax < 25:
		$Tax.add_theme_color_override("font_color", green)
	elif tax < 50:
		$Tax.add_theme_color_override("font_color", lGreen)
	elif tax < 75:
		$Tax.add_theme_color_override("font_color", orange) 
	else:
		$Tax.add_theme_color_override("font_color", red)

var red = Color(255, 0, 0, 255)
var orange = Color(255, 125, 0, 255) 
var lGreen = Color(135, 255, 0, 255)
var green = Color(0, 255, 0, 255)
var black = Color(0, 0, 0, 255)
