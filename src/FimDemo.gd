extends Control

func _input(event):
	if event.is_action_pressed("ui_accept") or event.is_action_pressed("toggle_pause"):
		scene_root.notification(NOTIFICATION_WM_QUIT_REQUEST)
		get_tree().quit()
		
onready var root = get_tree().get_root()
onready var scene_root = root.get_child(root.get_child_count() - 1)
