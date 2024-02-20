extends Button

@onready
var globalData = get_node("/root/GlobalData")
var display : Button
var checkbox : String


func _ready():
	display = self
	checkbox = self.to_string().split(":")[0]
	
	if checkbox == "Left Starting Area":
		if !globalData.Data.leftStartingArea:
			display.text = ""
		else:
			display.text = "✓"
	if checkbox == "Parked":
		if !globalData.Data.parked:
			display.text = ""
		else:
			display.text = "✓"
	if checkbox == "Clibmed":
		if !globalData.Data.climbed:
			display.text = ""
		else:
			display.text = "✓"
	if checkbox == "Spotlit":
		if !globalData.Data.spotlit:
			display.text = ""
		else:
			display.text = "✓"
	
func _on_pressed():
	if checkbox == "Left Starting Area":
		if globalData.Data.leftStartingArea:
			globalData.Data.leftStartingArea = false
			display.text = ""
		else:
			globalData.Data.leftStartingArea = true
			display.text = "✓"
	if checkbox == "Parked":
		if globalData.Data.parked:
			globalData.Data.parked = false
			display.text = ""
		else:
			globalData.Data.parked = true
			display.text = "✓"
	if checkbox == "Climbed":
		if globalData.Data.climbed:
			globalData.Data.climbed = false
			display.text = ""
		else:
			globalData.Data.climbed = true
			display.text = "✓"
	if checkbox == "Spotlit":
		if globalData.Data.spotlit:
			globalData.Data.spotlit = false
			display.text = ""
		else:
			globalData.Data.spotlit = true
			display.text = "✓"
	
