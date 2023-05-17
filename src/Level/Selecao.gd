extends Control


onready var pato = ResourceLoader.load("res://src/Actors/Player.tscn").instance()
var carregandoNivel = false

func _ready():
	pass

func _input(event):
	if event.is_action_pressed("ui_accept"):
		$Fundo1/Fase1.select_nivel()
	hide()

#func _process(delta):
#	pass
