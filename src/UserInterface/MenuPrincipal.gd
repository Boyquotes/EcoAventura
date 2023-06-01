extends Control

var titulo = true

var cena1 = "res://src/Level/historia-cena1.tscn"

func _input(event):
	if titulo and event.is_pressed() and !event.is_action("toggle_fullscreen"):
		var interface = ResourceLoader.load(cena1)
		var interfaceInstance = interface.instance()
		get_parent().add_child(interfaceInstance)
		hide()
		titulo = false
