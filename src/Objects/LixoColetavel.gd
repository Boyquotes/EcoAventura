extends Lixo

onready var animation_player: AnimationPlayer = $AnimationPlayer

onready var level = get_parent().get_parent()

func _on_body_entered(_body):
	if tipoLixeira == TipoLixeira.organico:
		if level.collectedCoin < 4:
			level.collectedCoin += 1
			animation_player.play("picked")
			if level.collectedCoin == 4:
				level.uiLixo.setLixo(2)
	elif level.collectedCoin >= 4:
		level.collectedCoin += 1
		animation_player.play("picked")
	
