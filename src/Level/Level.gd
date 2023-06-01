class_name Level
extends LevelClass

var collectedLixo = 0 setget setCollectedLixo
func setCollectedLixo(quantidade: int):
	collectedLixo = quantidade
	if quantidade >= 8:
		nivelCompletado = true
# The "_" prefix is a convention to indicate that variables are private

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

	uiLixo.setLixo(1)
	textoTentarSairCedo = ["Eu preciso coletar todo lixo antes ir para as lixeiras"]
	._ready()



