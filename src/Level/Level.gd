class_name Level
extends LevelClass

var collectedLixo = 0 setget setCollectedLixo
func setCollectedLixo(quantidade: int):
	collectedLixo = quantidade
	if quantidade >= numeroReciclaveis + numeroOrganicos and quantidade != 0:
		nivelCompletado = true
		caixaTexto.mostrarTextos([
			"Ótimo! Esses parecem ser todos os lixos nessa area!",
			"Vamos para as lixeiras para fazer a separação"
		])

var numeroReciclaveis = 0
var numeroOrganicos = 0
onready var uiLixo = $CanvasLayer/TipoLixo

func _ready():
	uiLixo.setLixo(1)
	for child in get_children():
		if child is Player:
			var camera = child.get_node("Camera")
			camera.limit_left = LIMIT_LEFT
			camera.limit_top = LIMIT_TOP
			camera.limit_right = LIMIT_RIGHT
			camera.limit_bottom = LIMIT_BOTTOM
		if (child is Node) and child.name == "Lixos":
			for lixo in child.get_children():
				if lixo.tipoDeLixeira == Lixo.TipoLixeira.organico:
					numeroOrganicos += 1
				else:
					numeroReciclaveis += 1
	uiLixo.setLixo(1)
	textoTentarSairCedo = ["Eu preciso coletar todo o lixo antes ir para as lixeiras"]
	._ready()

func _on_Player_animacaoTerminada(nome):
	if nome == "animacaoInicio":
		caixaTexto.mostrarTextos([
			"Me ajude a coletar os lixos para a separção",
			"É importante não misturar o lixo seco e o orgânico então vamos primeiro coletar somente os lixos recicláveis"
		])
