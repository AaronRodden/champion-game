extends Node2D

@onready var VirtualButtons = $"."
@onready var Square = $Square
@onready var Triangle = $Triangle
@onready var R1 = $R1
@onready var L1 = $L1
@onready var Cross = $Cross
@onready var Circle = $Circle
@onready var R2 = $R2
@onready var L2 = $L2

var button_order = {0: "Square", 1: "Triangle", 2: "R1", 3: "L1", 4: "Cross", 5: "Circle", 6: "R2", 7: "L2"}

var button_remapping = false
var current_button_remap = 0

func _process(delta):
	if not button_remapping:
		if Input.is_action_pressed("Square"):
			Square.get_node("Unpressed").visible = false
			Square.get_node("Pressed").visible = true
		if Input.is_action_just_released("Square"):
			Square.get_node("Pressed").visible = false
			Square.get_node("Unpressed").visible = true
			
		if Input.is_action_pressed("Triangle"):
			Triangle.get_node("Unpressed").visible = false
			Triangle.get_node("Pressed").visible = true
		if Input.is_action_just_released("Triangle"):
			Triangle.get_node("Pressed").visible = false
			Triangle.get_node("Unpressed").visible = true
			
		if Input.is_action_pressed("R1"):
			R1.get_node("Unpressed").visible = false
			R1.get_node("Pressed").visible = true
		if Input.is_action_just_released("R1"):
			R1.get_node("Pressed").visible = false
			R1.get_node("Unpressed").visible = true
			
		if Input.is_action_pressed("L1"):
			L1.get_node("Unpressed").visible = false
			L1.get_node("Pressed").visible = true
		if Input.is_action_just_released("L1"):
			L1.get_node("Pressed").visible = false
			L1.get_node("Unpressed").visible = true
			
		if Input.is_action_pressed("Cross"):
			Cross.get_node("Unpressed").visible = false
			Cross.get_node("Pressed").visible = true
		if Input.is_action_just_released("Cross"):
			Cross.get_node("Pressed").visible = false
			Cross.get_node("Unpressed").visible = true
			
		if Input.is_action_pressed("Circle"):
			Circle.get_node("Unpressed").visible = false
			Circle.get_node("Pressed").visible = true
		if Input.is_action_just_released("Circle"):
			Circle.get_node("Pressed").visible = false
			Circle.get_node("Unpressed").visible = true
			
		if Input.is_action_pressed("R2"):
			R2.get_node("Unpressed").visible = false
			R2.get_node("Pressed").visible = true
		if Input.is_action_just_released("R2"):
			R2.get_node("Pressed").visible = false
			R2.get_node("Unpressed").visible = true
			
		if Input.is_action_pressed("L2"):
			L2.get_node("Unpressed").visible = false
			L2.get_node("Pressed").visible = true
		if Input.is_action_just_released("L2"):
			L2.get_node("Pressed").visible = false
			L2.get_node("Unpressed").visible = true
		
		
func _input(event: InputEvent) -> void:
	print(event.as_text())
	if button_remapping:
		if (event is InputEventJoypadButton) and event.pressed:
			InputMap.add_action(button_order[current_button_remap])
			InputMap.action_add_event(button_order[current_button_remap], event)
			current_button_remap += 1
			print(current_button_remap)
			if current_button_remap >= 8:
				$RemapPointer.visible = false
				button_remapping = false
				current_button_remap = 0
			else:
				$RemapPointer.position = $".".get_node(button_order[current_button_remap]).get_node("Unpressed").position + Vector2(0, -60)

func _on_mapping_button_pressed() -> void:
	InputMap.load_from_project_settings()
	print(Square.position)
	$RemapPointer.position = Square.get_node("Unpressed").position + Vector2(0, -60)
	$RemapPointer.visible = true
	
	button_remapping = true
	
	#for item in action_list.get_children()
