extends Area2D
class_name Lixo

onready var lixos: Sprite = $lixos
enum tipoLixo { reciclavel, organico }

enum TipoLixeira {
	vidro = 0,
	plastico = 1,
	metal = 2,
	papel = 3,
	organico = 4
}

export(TipoLixeira) var tipoLixeira
export(int, 0, 15) var textura
export(tipoLixo) var teste = tipoLixo.organico

func _ready():
	lixos.frame_coords = Vector2( tipoLixeira, textura )

	
