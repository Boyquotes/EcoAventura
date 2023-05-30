extends Control

onready var reciclavel = $Reciclavel
onready var naoreciclavel = $NaoReciclavel

func setLixo(qual):
	if qual == 0:
		naoreciclavel.visible = false
		reciclavel.visible = false
	elif qual == 1:
		reciclavel.visible = true
		naoreciclavel.visible = false
	else:
		naoreciclavel.visible = true
		reciclavel.visible = false
		
	
