extends Panel

@onready var enf = $MainContainer/AttributeContainer/Enforcement/AttributeBar
@onready var pro = $MainContainer/AttributeContainer/Propaganda/AttributeBar
@onready var intel = $MainContainer/AttributeContainer/Intelligence/AttributeBar
@onready var dip = $MainContainer/AttributeContainer/Diplomacy/AttributeBar
@onready var soc = $MainContainer/AttributeContainer/SocialServices/AttributeBar
@onready var inf = $MainContainer/AttributeContainer/Infrastructure/AttributeBar

func _ready():
	pass

#Update AP Functions
func update_enf(value):
	for i in enf.get_child_count():
		if value > i:
			enf.get_child(i).color = Color(0.057,0.748,0.048,1)
		else:
			enf.get_child(i).color = Color(1,1,1,1)
			
func update_pro(value):
	for i in pro.get_child_count():
		if value > i:
			pro.get_child(i).color = Color(0.057,0.748,0.048,1)
		else:
			pro.get_child(i).color = Color(1,1,1,1)
			
func update_int(value):
	for i in intel.get_child_count():
		if value > i:
			intel.get_child(i).color = Color(0.057,0.748,0.048,1)
		else:
			intel.get_child(i).color = Color(1,1,1,1)

func update_dip(value):
	for i in dip.get_child_count():
		if value > i:
			dip.get_child(i).color = Color(0.057,0.748,0.048,1)
		else:
			dip.get_child(i).color = Color(1,1,1,1)

func update_soc(value):
	for i in soc.get_child_count():
		if value > i:
			soc.get_child(i).color = Color(0.057,0.748,0.048,1)
		else:
			soc.get_child(i).color = Color(1,1,1,1)

func update_inf(value):
	for i in inf.get_child_count():
		if value > i:
			inf.get_child(i).color = Color(0.057,0.748,0.048,1)
		else:
			inf.get_child(i).color = Color(1,1,1,1)


#Button press functions
func _on_enf_minus_button_pressed() -> void:
	if (Global.ap < 20) and (Global.enforcement > 0):
		Global.ap += 1
		Global.enforcement -= 1
		update_enf(Global.enforcement)
	else:
		pass


func _on_enf_plus_button_pressed() -> void:
	if (Global.ap > 0) and (Global.enforcement < 10):
		Global.ap -= 1
		Global.enforcement += 1
		update_enf(Global.enforcement)
	else:
		pass


func _on_pro_minus_button_pressed() -> void:
	if (Global.ap < 20) and (Global.propaganda > 0):
		Global.ap += 1
		Global.propaganda -= 1
		update_pro(Global.propaganda)
	else:
		pass


func _on_pro_plus_button_pressed() -> void:
	if (Global.ap > 0) and (Global.propaganda < 10):
		Global.ap -= 1
		Global.propaganda += 1
		update_pro(Global.propaganda)
	else:
		pass


func _on_int_minus_button_pressed() -> void:
	if (Global.ap < 20) and (Global.intelligence > 0):
		Global.ap += 1
		Global.intelligence -= 1
		update_int(Global.intelligence)
	else:
		pass


func _on_int_plus_button_pressed() -> void:
	if (Global.ap > 0) and (Global.intelligence < 10):
		Global.ap -= 1
		Global.intelligence += 1
		update_int(Global.intelligence)
	else:
		pass


func _on_dip_minus_button_pressed() -> void:
	if (Global.ap < 20) and (Global.diplomacy > 0):
		Global.ap += 1
		Global.diplomacy -= 1
		update_dip(Global.diplomacy)
	else:
		pass


func _on_dip_plus_button_pressed() -> void:
	if (Global.ap > 0) and (Global.diplomacy < 10):
		Global.ap -= 1
		Global.diplomacy += 1
		update_dip(Global.diplomacy)
	else:
		pass


func _on_soc_minus_button_pressed() -> void:
	if (Global.ap < 20) and (Global.socialServices > 0):
		Global.ap += 1
		Global.socialServices -= 1
		update_soc(Global.socialServices)
	else:
		pass


func _on_soc_plus_button_pressed() -> void:
	if (Global.ap > 0) and (Global.socialServices < 10):
		Global.ap -= 1
		Global.socialServices += 1
		update_soc(Global.socialServices)
	else:
		pass


func _on_inf_minus_button_pressed() -> void:
	if (Global.ap < 20) and (Global.infrastructure > 0):
		Global.ap += 1
		Global.infrastructure -= 1
		update_inf(Global.infrastructure)
	else:
		pass


func _on_inf_plus_button_pressed() -> void:
	if (Global.ap > 0) and (Global.infrastructure < 10):
		Global.ap -= 1
		Global.infrastructure += 1
		update_inf(Global.infrastructure)
	else:
		pass
