extends Lixo

var lixoAtual: Vector2
var listaLixos: Array = [
	Vector2(0, TipoLixeira.organico),
	Vector2(0, TipoLixeira.metal),
	Vector2(0, TipoLixeira.plastico),
	Vector2(0, TipoLixeira.papel),
	Vector2(0, TipoLixeira.vidro),
	Vector2(3, TipoLixeira.organico),
	Vector2(0, TipoLixeira.organico),
]

func proximoLixo():
	lixoAtual = listaLixos.pop_front()
	tipoDeLixeira = lixoAtual.y
	textura = lixoAtual.x
	
