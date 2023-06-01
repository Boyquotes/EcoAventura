extends Lixo

var lixoAtual: Vector2
var listaLixos: Array = [
	Vector2(TipoLixeira.plastico, 0),
	Vector2(TipoLixeira.metal, 3),
	Vector2(TipoLixeira.organico, 0),
	Vector2(TipoLixeira.plastico, 4),
	Vector2(TipoLixeira.vidro, 0),
	Vector2(TipoLixeira.metal, 1),
	Vector2(TipoLixeira.papel, 2),
	Vector2(TipoLixeira.vidro, 1),
	Vector2(TipoLixeira.organico, 2),
	Vector2(TipoLixeira.metal, 0),
	Vector2(TipoLixeira.papel, 0),
	Vector2(TipoLixeira.plastico, 1),
	Vector2(TipoLixeira.papel, 1),
	Vector2(TipoLixeira.organico, 1),
	Vector2(TipoLixeira.vidro, 2),
]

func _ready():
	lixoAtual = listaLixos.pop_front()
	textura = lixoAtual.y
	tipoDeLixeira = lixoAtual.x

func proximoLixo() -> bool:
	var result = listaLixos.pop_front()
	if result != null:
		lixoAtual = result
		textura = lixoAtual.y
		tipoDeLixeira = lixoAtual.x
		return false
	else:
		hide()
		return true
	
