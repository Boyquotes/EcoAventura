extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var pato = ResourceLoader.load("res://src/Actors/Player.tscn").instance()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _input(event):
	if event.is_action_pressed("ui_accept"):
		$Fundo1/Fase1.select_nivel()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_FaseBotao_pressed():
	hide()
	pass
