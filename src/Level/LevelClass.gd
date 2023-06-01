class_name LevelClass
extends Node2D

signal nivelAcabado

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
			trans.connect("animation_finished", self, "fimNivel")
		else:
			caixaTexto.mostrarTextos(textoTentarSairCedo)
			caixaTexto.connect("textoCompletado", $Player, "voltar")

func _ready():
	trans.play("FadeIn")
	for child in get_children():
		if child is Player:
			var camera = child.get_node("Camera")
			camera.limit_left = LIMIT_LEFT
			camera.limit_top = LIMIT_TOP
			camera.limit_right = LIMIT_RIGHT
			camera.limit_bottom = LIMIT_BOTTOM

func fimNivel(animation_name):
	if animation_name == "FadeIn":
		emit_signal("nivelAcabado")
		trans.play("FadeIn")
		queue_free()

