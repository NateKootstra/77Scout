extends TextEdit

@onready
var globalData = get_node("/root/GlobalData")
var comments : TextEdit

# Called when the node enters the scene tree for the first time.
func _ready():
	comments = self
	if not globalData.Data.comments == null:
		comments.text = globalData.Data.comments
		
func _comments():
	globalData.Data.comments = comments.text
