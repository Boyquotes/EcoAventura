extends Control

var titulo = true

func _input(event):
	if titulo and event.is_pressed():
		var jogo = ResourceLoader.load("res://src/Main/Jogo.tscn")
		var jogoInstance = jogo.instance()
		get_parent().add_child(jogoInstance)
		hide()
		titulo = false
