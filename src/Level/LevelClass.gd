class_name LevelClass
extends Node2D

signal nivelAcabado(completado)

var nivelCompletado = false
var textoTentarSairCedo = ["Eu preciso completar o objectivo"]

var LIMIT_LEFT = -315
var LIMIT_TOP = -250
var LIMIT_RIGHT = 955
var LIMIT_BOTTOM = 690
# The "_" prefix is a convention to indicate that variables are private

onready var trans = get_node("/root/Game/CanvasLayer/Transicoes/AnimationPlayer")
onready var caixaTexto = get_node("/root/Game/Interface/CaixaTexto")

func _on_Fim_body_entered(body: Player):
	if body is Player:
		if nivelCompletado:
			$Fim/Barreira.queue_free()
			body.terminarFase()
			yield(get_tree().create_timer(1), "timeout")
			trans.play_backwards("FadeIn")
			trans.connect("animation_finished", self, "_on_animation_finished")
		else:
			caixaTexto.mostrarTextos(textoTentarSairCedo)
			caixaTexto.connect("textoCompletado", self, "playerVoltar")

func _ready():
	name = "Level"
	trans.play("FadeIn")
	for child in get_children():
		if child is Player:
			var camera = child.get_node("Camera")
			camera.limit_left = LIMIT_LEFT
			camera.limit_top = LIMIT_TOP
			camera.limit_right = LIMIT_RIGHT
			camera.limit_bottom = LIMIT_BOTTOM

func _on_animation_finished(anim):
	if anim == "FadeIn":
		fimNivel()

func fimNivel():
	emit_signal("nivelAcabado", nivelCompletado)
	trans.play("FadeIn")
	queue_free()

func playerVoltar():
	($Player as Player).voltar()
	caixaTexto.disconnect("textoCompletado", self, "playerVoltar")
