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



func _process(delta):
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
		
