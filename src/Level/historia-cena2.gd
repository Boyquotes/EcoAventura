extends Control

var scane_path="res://src/Level/historia-cena3.tscn"

func _input(event):
	if event.is_pressed():
		load_scane(scane_path)
	
func load_scane(path):
	var scane: PackedScene = ResourceLoader.load(path)
	if scane:
		get_parent().add_child(scane.instance())
		queue_free()
