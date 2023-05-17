extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var pato = ResourceLoader.load("res://src/Actors/Player.tscn").instance()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_FaseBotao_pressed():
	hide()
	pass
