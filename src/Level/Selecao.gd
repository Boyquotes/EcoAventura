extends Control


onready var pato = ResourceLoader.load("res://src/Actors/Player.tscn").instance()
var carregandoNivel = false
onready var player = $Fundo1/Zeca/AnimationPlayer

var nivelSelecionado = false

func _ready():
	pass

func _input(event):
	if event.is_action_pressed("ui_accept") and not nivelSelecionado:
		nivelSelecionado = true
		player.play("Pular")


func _on_AnimationPlayer_animation_finished(anim):
	$Fundo1/Fase1.select_nivel()
	hide()
