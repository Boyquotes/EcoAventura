extends Control

var titulo = true

func _input(event):
	if titulo and event.is_pressed():
		var interface = ResourceLoader.load("res://src/Main/Interface.tscn")
		var interfaceInstance = interface.instance()
		get_parent().add_child(interfaceInstance)
		hide()
		titulo = false
