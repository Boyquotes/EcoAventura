extends Lixo

var lixoAtual: Vector2
var listaLixos: Array = [
	Vector2(TipoLixeira.vidro, 0),
	Vector2(TipoLixeira.plastico, 0),
	Vector2(TipoLixeira.metal, 0),
	Vector2(TipoLixeira.papel, 0),
	Vector2(TipoLixeira.organico, 0),
	Vector2(TipoLixeira.vidro, 1),
	Vector2(TipoLixeira.plastico, 1),
	Vector2(TipoLixeira.metal, 1),
	Vector2(TipoLixeira.papel, 1),
	Vector2(TipoLixeira.organico, 1),
]

func _ready():
	lixoAtual = listaLixos.pop_front()
	lixos.frame_coords = lixoAtual
	textura = lixoAtual.y
	tipoDeLixeira = lixoAtual.x

func proximoLixo():
	lixoAtual = listaLixos.pop_front()
	textura = lixoAtual.y
	tipoDeLixeira = lixoAtual.x
	lixos.frame_coords = lixoAtual
	
