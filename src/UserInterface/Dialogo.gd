extends Control

onready var caixaTexto = $TextureRect/Label
onready var timer = $Timer

var limiteChars = 0
var fila: Array = []
var textoAtual: String = ''

func mostrarTextos(textoArr: Array):
	show()
	fila.append_array(textoArr)
	if textoAtual == '':
		proximoTexto()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		proximoTexto()

func _on_Timer_timeout():
	if caixaTexto.get_visible_characters() >= limiteChars:
		timer.stop()
	else:
		caixaTexto.visible_characters += 1;

func proximoTexto():
	print(fila.size())
	if fila.size() > 0:
		textoAtual = fila.pop_front()
		limiteChars = textoAtual.length()
		caixaTexto.set_visible_characters(0)
		caixaTexto.set_text(textoAtual)
		timer.start()
	else:
		textoAtual = ''
		caixaTexto.set_visible_characters(0)
		caixaTexto.set_text(textoAtual)
		hide()
