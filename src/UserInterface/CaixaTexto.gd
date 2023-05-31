class_name CaixaTexto
extends Control

signal textoCompletado()

onready var caixaTexto = $TextureRect/Label
onready var timer = $Timer

var limiteChars = 0
var fila: Array = []
var textoAtual: String = ''
var rodandoTexto = false

func mostrarTextos(textoArr: Array):
	show()
	get_tree().paused = true
	fila = textoArr
	limiteChars = 0
	proximoTexto()

func _input(event):
	if event.is_action_pressed("ui_accept") and visible:
		proximoTexto()

func _on_Timer_timeout():
	$SfxFala.play()
	caixaTexto.visible_characters += 1
	if caixaTexto.get_visible_characters() >= limiteChars:
		timer.stop()

func proximoTexto():
	if caixaTexto.get_visible_characters() < limiteChars:
		caixaTexto.visible_characters = limiteChars
	elif fila.size() > 0:
		textoAtual = fila.pop_front()
		caixaTexto.set_visible_characters(0)
		caixaTexto.set_text(textoAtual)
		limiteChars = caixaTexto.get_total_character_count()
		timer.start()
	else:
		textoAtual = ''
		caixaTexto.set_visible_characters(0)
		caixaTexto.set_text(textoAtual)
		get_tree().paused = false
		hide()
		emit_signal("textoCompletado")
