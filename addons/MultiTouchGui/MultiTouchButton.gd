extends Button
class_name MultiTouchButton

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _gui_input(event):
	var event_pos_adjusted = event.position + global_position
	var inside = event_pos_adjusted.x > position.x and event_pos_adjusted.y > position.y and event_pos_adjusted.x < position.x + size.x and event_pos_adjusted.y < position.y + size.y
	
	if event is InputEventScreenTouch and event.pressed and inside:
		
		if toggle_mode:
			toggled.emit()
			button_pressed = true
		else:
			pressed.emit()
			button_down.emit()
			text = "Pressed"
		
		
		
		
	elif (event is InputEventScreenTouch and inside) or (event is InputEventScreenTouch and !event.pressed and !inside):
		button_up.emit()
		button_pressed = false
		text = "Not Pressed"
	
	
	
