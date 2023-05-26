extends Node2D

var collectedCoin = 0

const LIMIT_LEFT = -315
const LIMIT_TOP = -250
const LIMIT_RIGHT = 955
const LIMIT_BOTTOM = 690
# The "_" prefix is a convention to indicate that variables are private
onready var uiLixo = get_node("/root/Game/Jogo/InterfaceLayer/TipoLixo")
func _ready():
	uiLixo.setLixo(1)
	for child in get_children():
		if child is Player:
			var camera = child.get_node("Camera")
			camera.limit_left = LIMIT_LEFT
			camera.limit_top = LIMIT_TOP
			camera.limit_right = LIMIT_RIGHT
			camera.limit_bottom = LIMIT_BOTTOM
