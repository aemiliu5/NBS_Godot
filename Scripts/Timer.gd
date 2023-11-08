extends RichTextLabel

var time = 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta

	# Update the text of the label with the formatted time
	text = "[font_size=48][center]%.2f[/center][/font_size]" % time
	
	# Move label depending on position so it's always visible
	if(get_parent().position.y < 100):
		position.y = 32
	else:
		position.y = -109
		
	#print(position.y)
