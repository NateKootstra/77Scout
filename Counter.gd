extends Node2D


@onready
var globalData = get_node("/root/GlobalData")
var display : Button
var counter : String

func _ready():
	display = get_child(2)
	counter = self.to_string().split(":")[0]
	
	if counter == "Amp Notes":
		display.text = str(globalData.Data.autoAmpNotes)
	if counter == "Speaker Notes":
		display.text = str(globalData.Data.autoSpeakerNotes)
	if counter == "Starting Location":
		if globalData.Data.autoStartingLocation == 0:
			display.text = "Left"
		if globalData.Data.autoStartingLocation == 1:
			display.text = "Center"
		if globalData.Data.autoStartingLocation == 2:
			display.text = "Right"
	if counter == "Notes Collected":
		display.text = str(globalData.Data.teleopNotesCollected)
	if counter == "Amp Notes T":
		display.text = str(globalData.Data.teleopAmpNotes)
	if counter == "Speaker Notes T":
		display.text = str(globalData.Data.teleopSpeakerNotes)
	if counter == "Speaker Notes (Amped)":
		display.text = str(globalData.Data.teleopSpeakerNotesAmped)
	if counter == "Trap":
		display.text = str(globalData.Data.trap)
	if counter == "Harmony":
		display.text = str(globalData.Data.harmony)
		
	

func _increase():
	if counter == "Amp Notes":
		globalData.Data.autoAmpNotes += 1
		if globalData.Data.autoAmpNotes > 99:
			globalData.Data.autoAmpNotes = 99
		display.text = str(globalData.Data.autoAmpNotes)
	if counter == "Speaker Notes":
		globalData.Data.autoSpeakerNotes += 1
		if globalData.Data.autoSpeakerNotes > 99:
			globalData.Data.autoSpeakerNotes = 99
		display.text = str(globalData.Data.autoSpeakerNotes)
	if counter == "Starting Location":
		globalData.Data.autoStartingLocation += 1
		if globalData.Data.autoStartingLocation > 2:
			globalData.Data.autoStartingLocation = 2
		if globalData.Data.autoStartingLocation == 0:
			display.text = "Left"
		if globalData.Data.autoStartingLocation == 1:
			display.text = "Center"
		if globalData.Data.autoStartingLocation == 2:
			display.text = "Right"
	if counter == "Notes Collected":
		globalData.Data.teleopNotesCollected += 1
		if globalData.Data.teleopNotesCollected > 99:
			globalData.Data.teleopNotesCollected = 99
		display.text = str(globalData.Data.teleopNotesCollected)
	if counter == "Amp Notes T":
		globalData.Data.teleopAmpNotes += 1
		if globalData.Data.teleopAmpNotes > 99:
			globalData.Data.teleopAmpNotes = 99
		display.text = str(globalData.Data.teleopAmpNotes)
	if counter == "Speaker Notes T":
		globalData.Data.teleopSpeakerNotes += 1
		if globalData.Data.teleopSpeakerNotes > 99:
			globalData.Data.teleopSpeakerNotes = 99
		display.text = str(globalData.Data.teleopSpeakerNotes)
	if counter == "Speaker Notes (Amped)":
		globalData.Data.teleopSpeakerNotesAmped += 1
		if globalData.Data.teleopSpeakerNotesAmped > 99:
			globalData.Data.teleopSpeakerNotesAmped = 99
		display.text = str(globalData.Data.teleopSpeakerNotesAmped)
	if counter == "Trap":
		globalData.Data.trap += 1
		if globalData.Data.trap > 3:
			globalData.Data.trap = 3
		display.text = str(globalData.Data.trap)
	if counter == "Harmony":
		globalData.Data.harmony += 1
		if globalData.Data.harmony > 2:
			globalData.Data.harmony = 2
		display.text = str(globalData.Data.harmony)
	
func _decrease():
	if counter == "Amp Notes":
		globalData.Data.autoAmpNotes -= 1
		if globalData.Data.autoAmpNotes < 0:
			globalData.Data.autoAmpNotes = 0
		display.text = str(globalData.Data.autoAmpNotes)
	if counter == "Speaker Notes":
		globalData.Data.autoSpeakerNotes -= 1
		if globalData.Data.autoSpeakerNotes < 0:
			globalData.Data.autoSpeakerNotes = 0
		display.text = str(globalData.Data.autoSpeakerNotes)
	if counter == "Starting Location":
		globalData.Data.autoStartingLocation -= 1
		if globalData.Data.autoStartingLocation < 0:
			globalData.Data.autoStartingLocation = 0
		if globalData.Data.autoStartingLocation == 0:
			display.text = "Left"
		if globalData.Data.autoStartingLocation == 1:
			display.text = "Center"
		if globalData.Data.autoStartingLocation == 2:
			display.text = "Right"
	if counter == "Notes Collected":
		globalData.Data.teleopNotesCollected -= 1
		if globalData.Data.teleopNotesCollected < 0:
			globalData.Data.teleopNotesCollected = 0
		display.text = str(globalData.Data.teleopNotesCollected)
	if counter == "Amp Notes T":
		globalData.Data.teleopAmpNotes -= 1
		if globalData.Data.teleopAmpNotes < 0:
			globalData.Data.teleopAmpNotes = 0
		display.text = str(globalData.Data.teleopAmpNotes)
	if counter == "Speaker Notes T":
		globalData.Data.teleopSpeakerNotes -= 1
		if globalData.Data.teleopSpeakerNotes < 0:
			globalData.Data.teleopSpeakerNotes = 0
		display.text = str(globalData.Data.teleopSpeakerNotes)
	if counter == "Speaker Notes (Amped)":
		globalData.Data.teleopSpeakerNotesAmped -= 1
		if globalData.Data.teleopSpeakerNotesAmped < 0:
			globalData.Data.teleopSpeakerNotesAmped = 0
		display.text = str(globalData.Data.teleopSpeakerNotesAmped)
	if counter == "Trap":
		globalData.Data.trap -= 1
		if globalData.Data.trap < 0:
			globalData.Data.trap = 0
		display.text = str(globalData.Data.trap)
	if counter == "Harmony":
		globalData.Data.harmony -= 1
		if globalData.Data.harmony < 0:
			globalData.Data.harmony = 0
		display.text = str(globalData.Data.harmony)
