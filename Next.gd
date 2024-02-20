extends Button

var currentScene : int
var scenes : Array[String] = ["res://main.tscn", "res://scouting.tscn", "res://auto.tscn", "res://teleop.tscn", "res://endgame.tscn", "res://comments.tscn"]

func _ready():
	currentScene = scenes.find("res://" + get_parent().get_parent().to_string().split(":")[0] + ".tscn")

func _back():
	if currentScene > 0:
		currentScene -= 1
		get_tree().change_scene_to_file(scenes[currentScene])
	
func _next():
	if currentScene < 5:
		currentScene += 1
		get_tree().change_scene_to_file(scenes[currentScene])
