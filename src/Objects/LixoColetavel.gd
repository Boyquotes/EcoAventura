tool
extends Lixo

onready var animation_player: AnimationPlayer = $AnimationPlayer

onready var level: Level = get_parent().get_parent()

func _process(_delta):
	lixos.frame_coords = Vector2( tipoDeLixeira, textura )

func _on_body_entered(body):
	if body is Player:
		if tipoDeLixeira == TipoLixeira.organico:
			if level.collectedLixo < 4:
				level.collectedLixo += 1
				animation_player.play("picked")
				if level.collectedLixo == 4:
					level.uiLixo.setLixo(2)
			else:
				level.caixaTexto.mostrarTextos(["Esse lixo é orgânico e nós apenas estamos coletando os recicláveis"])
		elif level.collectedLixo >= 4:
			level.collectedLixo += 1
			animation_player.play("picked")
		else:
			level.caixaTexto.mostrarTextos(["Esse lixo é reciclável e nós apenas estamos coletando os orgânicos"])
	
