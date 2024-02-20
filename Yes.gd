extends Button

@onready
var globalData = get_node("/root/GlobalData")

# Called when the node enters the scene tree for the first time.
func _on_pressed():
	globalData.Data.writeMatch()
	globalData.Data = SaveData.new()
	get_tree().change_scene_to_file("res://main.tscn")
