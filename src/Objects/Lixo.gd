extends Area2D
class_name Lixo

onready var lixos: Sprite = $lixos

enum TipoLixeira {
	vidro = 0,
	plastico = 1,
	metal = 2,
	papel = 3,
	organico = 4
}

export(TipoLixeira) var tipoDeLixeira setget setTipoDeLixeira
export(int, 0, 15) var textura setget setTextura

func setTextura(id: int):
	if lixos:
		lixos.frame_coords.x = id
	textura = id
	
func setTipoDeLixeira(id: int):
	if lixos:
		lixos.frame_coords.y = id
	tipoDeLixeira = id

func _ready():
	lixos.frame_coords = Vector2( tipoDeLixeira, textura )


	
