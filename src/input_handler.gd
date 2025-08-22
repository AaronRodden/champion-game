extends Node

@onready var input_history = $InputHistory
@onready var special_move_history = $SpecialMoveHistory

var current_input = "_"
var previous_input = null

var wait = 0.2
var buffer_size = 60
var buffer = []

var frame_count
var frame_count_offset = 0

func _mapped_button_pressed(event):
	for action in Global.INPUT_MAP.values():
		if event.is_action(action) and event.is_pressed():
			return action
			
func _get_frame_count():
	return frame_count - frame_count_offset
	
func _init() -> void:
	buffer.resize(buffer_size)
	for x in buffer_size:
		buffer[x] = ""
	print(buffer)
	
#func _ready() -> void:
	#$Timer.wait_time = wait
	
func remove_text_after_line_count(full_text: String, max_lines: int):
	# Get the current text from the label node.
	#var full_text = label_node.text
	
	# Split the text into an array of lines using the newline character as a delimiter.
	var lines = full_text.split("\n")
	
	var new_text = ""
	# Check if the current number of lines exceeds the maximum allowed.
	if lines.size() > max_lines:
		# Create a new array containing only the lines up to the maximum count.
		var trimmed_lines = []
		for i in range(min(lines.size(), max_lines)):
			trimmed_lines.append(lines[i])
		
		# Join the trimmed lines back into a single string with newline characters.
		new_text = "\n".join(trimmed_lines)
	return new_text
	
func replace_first_line():
	pass
	
# TODO: Melty Blood AACC style input history 
func _parse_input_history():
	var history_text = input_history.text
	for buf_input in buffer:
		var new_input_text = buf_input + "\n"
		history_text = history_text.insert(0, new_input_text)
		
	var trimmed_history = remove_text_after_line_count(history_text, 25)
	input_history.text = trimmed_history

func _process(delta: float) -> void:
	
	#https://www.reddit.com/r/godot/comments/jchvyi/how_to_make_a_fighting_game_input_buffer_in_godot/
	#https://gameprogrammingpatterns.com/command.html
	#https://gamedev.stackexchange.com/questions/43708/fighting-game-and-input-buffering
	
	frame_count = Engine.get_frames_drawn()
	
	# TODO: Where should this be in the frame?
	if (_check_sequence(["ui_down", "ui_down_right", "ui_right"], 16)):
		special_move_history.text = "Last special move input: " + "qcf"
	if (_check_sequence(["ui_down", "ui_down_left", "ui_left"], 16)):
		special_move_history.text = "Last special move input: " + "qcb"
	if (_check_sequence(["ui_right", "ui_down", "ui_down_right"], 16)):
		special_move_history.text = "Last special move input: " + "DP"
	if (_check_sequence(["ui_left", "ui_down", "ui_down_left"], 16)):
		special_move_history.text = "Last special move input: " + "reverse DP"
	
	
	# TODO: How do I handle multiple button presses!
	var matched_action = ""
	# Check if a diagonal was pressed
	if Input.is_action_pressed("ui_up", true) and Input.is_action_pressed("ui_right", true):
		matched_action = "ui_up_right"
	elif Input.is_action_pressed("ui_down", true) and Input.is_action_pressed("ui_right", true):
		matched_action = "ui_down_right"
	elif Input.is_action_pressed("ui_up", true) and Input.is_action_pressed("ui_left", true):
		matched_action = "ui_up_left"
	elif Input.is_action_pressed("ui_down", true) and Input.is_action_pressed("ui_left", true):
		matched_action = "ui_down_left"
	
	# Then check for mapped inputs
	if matched_action == "":
		for action in Global.INPUT_MAP.values():
			if Input.is_action_pressed(action, true):
				matched_action = action
				
	if matched_action == "":
		matched_action = "_"
			
	current_input = matched_action
	
	## Only add too buffer if current input is unique from most recent input
	#if current_input == previous_input:
		#print(buffer)
		#return
	#else:
	
	previous_input = current_input
	buffer.pop_front()
	buffer.push_back(current_input)
	#print(buffer)
	
	_parse_input_history()


func _check_sequence(sequence, max_duration):
	var w = len(sequence) - 1
	
	for i in range(0, max_duration):
		#var buffer_offset = (frame_count-i+buffer_size) % buffer_size # DEBUG
		var direction = buffer[(frame_count-i+buffer_size) % buffer_size]

		if direction == sequence[w]:
			w = w - 1
		if w == -1:
			return true


func _on_timer_timeout() -> void:
	pass
	#for x in buffer_size-1:
		#buffer[x] = buffer[x+1]
		#buffer[buffer_size-1] = ""
