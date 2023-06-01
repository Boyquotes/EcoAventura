tool
extends Area2D
class_name Lixeira

signal player_entrou(lixeira)

enum TipoLixeira {
	vidro = 0,
	plastico = 1,
	metal = 2,
	papel = 3,
	organico = 4
}
onready var sprite = $TodasLixeiras

export(TipoLixeira) onready var tipo_de_lixeira setget setTipoLixeira

func setTipoLixeira(tipo: int):
	tipo_de_lixeira = tipo
	if sprite: sprite.frame_coords = Vector2(0, tipo_de_lixeira)

func _ready():
	sprite.frame_coords = Vector2(0, tipo_de_lixeira)

func _on_body_entered(body):
	if body is Player:
		sprite.frame_coords.x = 1
		emit_signal("player_entrou", self)
		
func _on_body_exited(body):
	if body is Player:
		sprite.frame_coords.x = 0
