extends Node2D

@onready
var globalData = get_node("/root/GlobalData")
var matches : Array
var teamNames : Array[String]
var teams : Array[Array]

func _ready():
	var baseNode : Node2D = find_child("Team")
	matches = globalData.Data.loadMatches()
	teams = []
	for match in matches:
		if not match.teamNumber in teamNames and not match.teamNumber == "":
			teamNames.append(match.teamNumber)
			
	for name in teamNames:
		var data = []
		data.append(name)
		var sample = 0
		var pointAverage : float = 0
		var highestPoints : float = 0
		var lowestPoints : float = 99999
		var trapAverage : float = 0
		var climb : float = 0
		var autoSpotsBool = [false, false, false]
		
		for match in matches:
			if match.teamNumber == name:
				sample += 1
				pointAverage += match.autoAmpNotes * 2 + match.autoSpeakerNotes * 5 + match.teleopAmpNotes + match.teleopSpeakerNotes * 2 + match.teleopSpeakerNotesAmped * 5
				if highestPoints < match.autoAmpNotes * 2 + match.autoSpeakerNotes * 5 + match.teleopAmpNotes + match.teleopSpeakerNotes * 2 + match.teleopSpeakerNotesAmped * 5:
					highestPoints = match.autoAmpNotes * 2 + match.autoSpeakerNotes * 5 + match.teleopAmpNotes + match.teleopSpeakerNotes * 2 + match.teleopSpeakerNotesAmped * 5
				if lowestPoints > match.autoAmpNotes * 2 + match.autoSpeakerNotes * 5 + match.teleopAmpNotes + match.teleopSpeakerNotes * 2 + match.teleopSpeakerNotesAmped * 5:
					lowestPoints = match.autoAmpNotes * 2 + match.autoSpeakerNotes * 5 + match.teleopAmpNotes + match.teleopSpeakerNotes * 2 + match.teleopSpeakerNotesAmped * 5
				trapAverage += match.trap
				if match.climbed:
					climb += 1
				autoSpotsBool[match.autoStartingLocation] = true
		pointAverage /= sample
		trapAverage /= sample
		var deviation = "+" + str(snapped(highestPoints - pointAverage, 1)) + "/-" + str(snapped(pointAverage - lowestPoints, 1))
		var autoSpots = ""
		if autoSpotsBool[0]:
			autoSpots += "L"
			if autoSpotsBool[1]:
				autoSpots += "/C"
				if autoSpotsBool[2]:
					autoSpots += "/R"
			elif autoSpotsBool[2]:
				autoSpots += "/R"
		elif autoSpotsBool[1]:
			autoSpots += "C"
			if autoSpotsBool[2]:
				autoSpots += "/R"
		else:
			autoSpots += "R"
		
		
		data.append(sample)
		data.append(snapped(pointAverage, 0.1))
		data.append(deviation)
		data.append(snapped(trapAverage, 0.1))
		data.append(str(snapped(climb / sample * 100, 1)) + "%")
		data.append(autoSpots)
		
		
		
		teams.append(data)
	
	for i in range(teams.size()):
		for j in range(teams.size()):
			var a = teams[i]
			var b = teams[j]
			if a[2] > b[2]:
				teams[i] = b
				teams[j] = a
	
	var y = 420
	for i in range(teams.size()):
		var newNode : Node2D = baseNode.duplicate()
		var team = teams[i]
		newNode.name = team[0]
		newNode.position.y = y
		newNode.show()
		
		newNode.get_child(0).text = "[center]Team " + team[0]
		newNode.get_child(2).text = "[right]" + str(team[2])
		newNode.get_child(4).text = "[right]" + team[3]
		newNode.get_child(6).text = "[right]" + team[6]
		newNode.get_child(7).text = "Climb: " + team[5]
		newNode.get_child(8).text = "[right]Trap: " + str(team[4])
		newNode.get_child(9).text = "#" + str(i + 1)
		newNode.get_child(10).text = "[right]" + str(team[1])
		
		
		baseNode.get_parent().add_child(newNode)
		
		y += 660
	baseNode.get_parent().custom_minimum_size[1] = y - 300
		
	print(teams)
