extends LevelClass

onready var iconeLixo = $CanvasLayer/Control/Lixo
onready var caixaTexto = get_parent().get_node("Jogo/InterfaceLayer/CaixaTexto")

func _init():
	LIMIT_LEFT = 0
	LIMIT_TOP = -250
	LIMIT_RIGHT = 1000
	LIMIT_BOTTOM = 690

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
	if lixeira.tipo_de_lixeira == iconeLixo.lixoAtual.y:
		iconeLixo.proximoLixo()
	else:
		caixaTexto.mostrarTextos(["Lixeira errada"])
		# caixaTexto.connect("textoCompletado", $Player, "voltar")
