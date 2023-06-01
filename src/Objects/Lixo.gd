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

export(TipoLixeira) var tipoDeLixeira
export(int, 0, 20) var textura

func _process(_delta):
	if lixos != null:
		lixos.frame_coords = Vector2( tipoDeLixeira, textura )


	
