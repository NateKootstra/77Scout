extends Button




# Called when the node enters the scene tree for the first time.
func _on_pressed():
	get_parent().get_child(4).show()
