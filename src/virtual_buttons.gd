extends Node2D

@onready var VirtualButtons = $"."
@onready var button_1 = $button_1
@onready var button_2 = $button_2
@onready var button_3 = $button_3
@onready var button_4 = $button_4
@onready var button_5 = $button_5
@onready var button_6 = $button_6
@onready var button_7 = $button_7
@onready var button_8 = $button_8


var button_remapping = false

var current_button_remap = 1

func _visualize_buttons():
	if Input.is_action_pressed("button_1"):
		button_1.get_node("Unpressed").visible = false
		button_1.get_node("Pressed").visible = true
	if Input.is_action_just_released("button_1"):
		button_1.get_node("Pressed").visible = false
		button_1.get_node("Unpressed").visible = true
		
	if Input.is_action_pressed("button_2"):
		button_2.get_node("Unpressed").visible = false
		button_2.get_node("Pressed").visible = true
	if Input.is_action_just_released("button_2"):
		button_2.get_node("Pressed").visible = false
		button_2.get_node("Unpressed").visible = true
		
	if Input.is_action_pressed("button_3"):
		button_3.get_node("Unpressed").visible = false
		button_3.get_node("Pressed").visible = true
	if Input.is_action_just_released("button_3"):
		button_3.get_node("Pressed").visible = false
		button_3.get_node("Unpressed").visible = true
		
	if Input.is_action_pressed("button_4"):
		button_4.get_node("Unpressed").visible = false
		button_4.get_node("Pressed").visible = true
	if Input.is_action_just_released("button_4"):
		button_4.get_node("Pressed").visible = false
		button_4.get_node("Unpressed").visible = true
		
	if Input.is_action_pressed("button_5"):
		button_5.get_node("Unpressed").visible = false
		button_5.get_node("Pressed").visible = true
	if Input.is_action_just_released("button_5"):
		button_5.get_node("Pressed").visible = false
		button_5.get_node("Unpressed").visible = true
		
	if Input.is_action_pressed("button_6"):
		button_6.get_node("Unpressed").visible = false
		button_6.get_node("Pressed").visible = true
	if Input.is_action_just_released("button_6"):
		button_6.get_node("Pressed").visible = false
		button_6.get_node("Unpressed").visible = true
		
	if Input.is_action_pressed("button_7"):
		button_7.get_node("Unpressed").visible = false
		button_7.get_node("Pressed").visible = true
	if Input.is_action_just_released("button_7"):
		button_7.get_node("Pressed").visible = false
		button_7.get_node("Unpressed").visible = true
		
	if Input.is_action_pressed("button_8"):
		button_8.get_node("Unpressed").visible = false
		button_8.get_node("Pressed").visible = true
	if Input.is_action_just_released("button_8"):
		button_8.get_node("Pressed").visible = false
		button_8.get_node("Unpressed").visible = true
	


func _process(delta):
	_visualize_buttons()
		
		
func _input(event: InputEvent) -> void:
	if button_remapping:
		if (event is InputEventJoypadButton) and event.pressed:
			#InputMap.add_action(Global.INPUT_MAP[current_button_remap])
			InputMap.action_add_event(Global.INPUT_MAP[current_button_remap], event)
			current_button_remap += 1
			if current_button_remap >= 9:
				$RemapPointer.visible = false
				button_remapping = false
				current_button_remap = 1
				
				# DEBUG: Print the input map 
				for action in InputMap.get_actions():
					if "button" in action:
						print(action + ": " + str(InputMap.action_get_events(action)))
			else:
				$RemapPointer.position = $".".get_node(Global.INPUT_MAP[current_button_remap]).get_node("Unpressed").position + Vector2(0, -60)		

func _on_mapping_button_pressed() -> void:
	InputMap.load_from_project_settings()
	$RemapPointer.position = button_1.get_node("Unpressed").position + Vector2(0, -60)
	$RemapPointer.visible = true
	
	# Clear prior button mappings
	for action in InputMap.get_actions():
		if "button" in action:
			InputMap.action_erase_events(action)
				
	button_remapping = true
	
	#for item in action_list.get_children()
