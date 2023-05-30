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
export(TipoLixeira) var tipo_de_lixeira

onready var sprite = $TodasLixeiras

func _ready():
	sprite.frame_coords = Vector2( 0, tipo_de_lixeira)


func _on_Lixeira_body_entered(body):
	if body is Player:
		emit_signal("player_entrou", self)
