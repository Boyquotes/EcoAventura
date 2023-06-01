extends LevelClass

onready var sfxCerto = $Certo
onready var iconeLixo = $CanvasLayer/Control/Lixo

func _init():
	LIMIT_LEFT = 0
	LIMIT_TOP = -250
	LIMIT_RIGHT = 1000
	LIMIT_BOTTOM = 690

func _ready():
	._ready()
	for child in get_children():
		if child is Lixeira:
			var c: Lixeira = child
			c.connect("player_entrou", self, "lixo_c")

func lixo_c(lixeira: Lixeira):
	if lixeira.tipo_de_lixeira == iconeLixo.tipoDeLixeira:
		nivelCompletado = iconeLixo.proximoLixo()
		sfxCerto.play()
	else:
		caixaTexto.mostrarTextos(["Lixeira errada"])
		# caixaTexto.connect("textoCompletado", $Player, "voltar")
