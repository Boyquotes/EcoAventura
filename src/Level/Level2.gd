extends Node2D

var collectedCoin = 0

const LIMIT_LEFT = -315
const LIMIT_TOP = -250
const LIMIT_RIGHT = 2000
const LIMIT_BOTTOM = 690


func _ready():
	for child in get_children():
		if child is Player:
			var camera = child.get_node("Camera")
			camera.limit_left = LIMIT_LEFT
			camera.limit_top = LIMIT_TOP
			camera.limit_right = LIMIT_RIGHT
			camera.limit_bottom = LIMIT_BOTTOM
		elif child is Lixeira:
			var c: Lixeira = child
			c.connect("player_entrou", self, "lixo_c")

func lixo_c(lixeira: Lixeira):	
	if lixeira.tipo_de_lixeira == Lixeira.TipoLixeira.plastico:
		print("plastico")
	elif lixeira.tipo_de_lixeira == Lixeira.TipoLixeira.metal:
		print("metal")
	elif lixeira.tipo_de_lixeira == Lixeira.TipoLixeira.vidro:
		print("vidro")
	elif lixeira.tipo_de_lixeira == Lixeira.TipoLixeira.organico:
		print("organico")
	elif lixeira.tipo_de_lixeira == Lixeira.TipoLixeira.papel:
		print("papel")
