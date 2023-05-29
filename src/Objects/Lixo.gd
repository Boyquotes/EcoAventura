class_name Lixo
extends Area2D

onready var animation_player = $AnimationPlayer
onready var sprite = $sprite
enum tipoLixo { reciclavel, organico }

onready var level = get_parent().get_parent()

export(tipoLixo) var teste = tipoLixo.organico
export(String, FILE, "*.png") var textura

func _ready():
	var texture = load(textura)
	sprite.set_texture(texture)

func _on_body_entered(_body):
	if teste == tipoLixo.organico:
		if level.collectedCoin < 4:
			animation_player.play("picked")
			level.collectedCoin += 1
	elif teste == tipoLixo.reciclavel:
		if level.collectedCoin >= 4:
			animation_player.play("picked")
	if level.collectedCoin >= 4:
		level.uiLixo.setLixo(2)
