class_name SaveData
extends Resource


@export var uploaded : bool = false
@export var teamNumber : String = ""
@export var matchNumber : String = ""
@export var leftStartingArea : bool = false
@export var autoAmpNotes : int = 0
@export var autoSpeakerNotes : int = 0
@export var autoStartingLocation : int = 1
@export var teleopNotesCollected : int = 0
@export var teleopAmpNotes : int = 0
@export var teleopSpeakerNotes : int = 0
@export var teleopSpeakerNotesAmped : int = 0
@export var parked : bool = false
@export var climbed : bool = false
@export var spotlit : bool = false
@export var trap : int = 0
@export var harmony : int = 0
@export var comments : String = ""

func writeMatch() -> void:
	if teamNumber == "":
		return
	if matchNumber == "":
		return
	ResourceSaver.save(self, "user://ma_" + teamNumber + "_" + matchNumber + ".tres")
	print(loadMatches()[2].teamNumber)
	
static func loadMatches() -> Array[SaveData]: 
	var data : Array[SaveData] = []
	var matches : Array = Array(DirAccess.get_files_at("user://"))
	for match in matches:
		if match.begins_with("ma_") and match.ends_with(".tres"):
			data.append(load("user://" + match))
	print(data)
	return data


