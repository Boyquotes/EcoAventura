extends Control

var scane_path="res://src/Level/Level.tscn"

func _input(event):
	if event is InputEventKey and event.pressed and event.scancode == KEY_ENTER:
		load_scane(scane_path)
	
func load_scane(path):
	var scane: PackedScene = ResourceLoader.load(path)
	if scane:
		get_tree().change_scene(scane.get_path())
