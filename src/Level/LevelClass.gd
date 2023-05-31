class_name LevelClass
extends Node2D

signal nivelAcabado

var LIMIT_LEFT = -315
var LIMIT_TOP = -250
var LIMIT_RIGHT = 955
var LIMIT_BOTTOM = 690
# The "_" prefix is a convention to indicate that variables are private

onready var trans: AnimationPlayer = get_node("/root/Game/CanvasLayer/Transicoes/AnimationPlayer")

func _ready():

	for child in get_children():
		if child is Player:
			var camera = child.get_node("Camera")
			camera.limit_left = LIMIT_LEFT
			camera.limit_top = LIMIT_TOP
			camera.limit_right = LIMIT_RIGHT
			camera.limit_bottom = LIMIT_BOTTOM
