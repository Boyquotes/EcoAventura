extends Control

export(String, FILE, "*.tscn") var nivel

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var disponivel = false
var completado = false
export var selecionado = false setget selecionar

onready var _textura = $Botao

onready var selecaoNivel = get_parent().get_parent()

func selecionar(value):
	selecionado = value
	# _textura.texture.
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func select_nivel():
	if not selecaoNivel.carregandoNivel:
		selecaoNivel.carregandoNivel = true
		var root = get_tree().get_root().get_child(0)
		var current_scene = root.get_child(0)

		current_scene.queue_free()
		# 2. Load the new scene.
		var new_scene = ResourceLoader.load(nivel)

		# 3. Instance the new scene.
		current_scene = new_scene.instance()
		root.add_child(current_scene)
		current_scene.add_child(selecaoNivel.pato)
		selecaoNivel.pato.position = Vector2(120, 530)
		selecaoNivel.carregandoNivel = false
		pass


func _on_FaseBotao_pressed():
	select_nivel()
	pass # Replace with function body.

