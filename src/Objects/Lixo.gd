class_name Lixo
extends Area2D

onready var animation_player: AnimationPlayer = $AnimationPlayer
onready var lixos: Sprite = $lixos
enum tipoLixo { reciclavel, organico }

enum TipoLixeira {
	vidro = 0,
	plastico = 1,
	metal = 2,
	papel = 3,
	organico = 4
}

onready var level = get_parent().get_parent()

export(TipoLixeira) var tipoLixeira
export(int, 0, 15) var textura
export(tipoLixo) var teste = tipoLixo.organico

func _ready():
	lixos.frame_coords = Vector2( tipoLixeira, textura )

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
	
