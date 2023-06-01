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
	textoTentarSairCedo = ["Ainda tem lixo para ser separado"]
	for child in get_children():
		if child is Lixeira:
			var c: Lixeira = child
			c.connect("player_entrou", self, "lixo_c")

func lixo_c(lixeira: Lixeira):
	if lixeira.tipo_de_lixeira == iconeLixo.tipoDeLixeira:
		sfxCerto.play()
		nivelCompletado = iconeLixo.proximoLixo()
		if nivelCompletado:
			caixaTexto.mostrarTextos([
				"Isso ai!, conseguimos separar todos os lixos",
			])
	else:
		if iconeLixo.tipoDeLixeira == Lixo.TipoLixeira.organico:
				caixaTexto.mostrarTextos(["Esse lixo é organico, e vai na lixeira marrom"])
		elif iconeLixo.tipoDeLixeira == Lixo.TipoLixeira.plastico:
				caixaTexto.mostrarTextos(["Esse lixo é plastico, e vai na lixeira vermelha"])
		elif iconeLixo.tipoDeLixeira == Lixo.TipoLixeira.vidro:
				caixaTexto.mostrarTextos(["Esse lixo é vidro, e vai na lixeira verde"])
		elif iconeLixo.tipoDeLixeira == Lixo.TipoLixeira.papel:
				caixaTexto.mostrarTextos(["Esse lixo é papel, e vai na lixeira azul"])
		elif iconeLixo.tipoDeLixeira == Lixo.TipoLixeira.metal:
				caixaTexto.mostrarTextos(["Esse lixo é metal, e vai na lixeira amarela"])


func _on_Player_animacaoTerminada(nome):
	if nome == "animacaoInicio":
		caixaTexto.mostrarTextos([
			"Agora eu presciso separar os lixos nas lixeiras corretas",
			"É bom lembrar qual tipo de lixo vai em cada cor",
			"""Vermelho vai os plasticos
Verde vai os vidros
Azul vai os papéis
Amarelo os metais
E Marrom os lixos orgânicos"""
		])
