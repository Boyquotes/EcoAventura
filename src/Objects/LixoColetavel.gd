tool
extends Lixo

onready var animation_player: AnimationPlayer = $AnimationPlayer

onready var level: Level = get_parent().get_parent()

func _on_body_entered(body):
	if body is Player:
		if tipoDeLixeira != TipoLixeira.organico:
			if level.collectedLixo < level.numeroReciclaveis:
				level.collectedLixo += 1
				animation_player.play("picked")
				if level.collectedLixo == level.numeroReciclaveis:
					level.uiLixo.setLixo(2)
					level.caixaTexto.mostrarTextos(["Bom trabalho! Agora vamos voltar e coletar os lixos orgânicos"])
			else:
				level.caixaTexto.mostrarTextos(["Esse lixo é reciclável e nós apenas estamos coletando os orgânicos"])
		elif level.collectedLixo >= level.numeroReciclaveis:
			level.collectedLixo += 1
			animation_player.play("picked")
		else:
			level.caixaTexto.mostrarTextos(["Esse lixo é orgânico e nós apenas estamos coletando os recicláveis"])

	
