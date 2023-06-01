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
	._ready()


