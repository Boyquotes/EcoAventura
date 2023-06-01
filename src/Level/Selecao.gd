extends Control

var carregandoNivel = false
var nivelSelecionado = false
var nivelAtual = 1

onready var player = $Fundo1/Zeca/AnimationPlayer
onready var trans: AnimationPlayer = get_node("/root/Game/CanvasLayer/Transicoes/AnimationPlayer")
onready var proximoNivel: int = 1

func _ready():
	setZecaPosition()
	for child in $Fundo1.get_children():
		if child is NivelSelecao:
			(child as NivelSelecao).atualizarNivel(nivelAtual)

func _input(event: InputEvent):
	if event.is_action_pressed("ui_up"):
		if proximoNivel == 1 and nivelAtual > 1:
			proximoNivel = 2
			setZecaPosition()
	elif event.is_action_pressed("ui_down"):
		if proximoNivel == 2 and nivelAtual > 0:
			proximoNivel = 1
			setZecaPosition()
	elif event.is_action_pressed("ui_accept") and not nivelSelecionado:
		nivelSelecionado = true
		player.play("Pular")
		yield(get_tree().create_timer(0.2), "timeout")
		trans.play_backwards("FadeIn")


func _on_AnimationPlayer_animation_finished(anim):
	if proximoNivel and anim == "Pular":
		var nivel: LevelClass = getProximoNivel().select_nivel()
		nivel.connect("nivelAcabado", self, "voltarSelecao")
		hide()

func voltarSelecao():
	player.play("RESET")
	trans.play("FadeIn")
	nivelSelecionado = false
	if proximoNivel >= nivelAtual:
		nivelAtual = nivelAtual + 1
	setZecaPosition()
	for child in $Fundo1.get_children():
		if child is NivelSelecao:
			(child as NivelSelecao).atualizarNivel(nivelAtual)
	show()

func getProximoNivel() -> NivelSelecao:
	return get_node("Fundo1/Fase" + str(proximoNivel)) as NivelSelecao

func setZecaPosition():
	$Fundo1/Zeca.position = getProximoNivel().rect_position + getProximoNivel().rect_pivot_offset
