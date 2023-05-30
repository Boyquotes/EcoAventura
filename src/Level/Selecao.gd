extends Control

var carregandoNivel = false

var nivelSelecionado = false

onready var player = $Fundo1/Zeca/AnimationPlayer

func _ready():
	pass

func _input(event):
	if event.is_action_pressed("ui_accept") and not nivelSelecionado:
		nivelSelecionado = true
		player.play("Pular")


func _on_AnimationPlayer_animation_finished(_anim):
	var nivel: Level = $Fundo1/Fase1.select_nivel()
	nivel.connect("nivelAcabado", self, "voltarSelecao")
	hide()

func voltarSelecao():
	show()
