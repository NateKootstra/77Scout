extends Node2D

@onready
var globalData = get_node("/root/GlobalData")
var teamNumber : LineEdit
var matchNumber : LineEdit


func _ready():
	teamNumber = self.get_child(1).get_child(1)
	matchNumber = self.get_child(2).get_child(1)
	
	teamNumber.text = globalData.Data.teamNumber
	matchNumber.text = globalData.Data.matchNumber
	
func _teamNumber(text):
	for digit in teamNumber.text:
		if not digit in ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]:
			teamNumber.text = ""
	globalData.Data.teamNumber = teamNumber.text
	
func _matchNumber(text):
	for digit in matchNumber.text:
		if not digit in ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]:
			matchNumber.text = ""
	globalData.Data.matchNumber = matchNumber.text
