class_name NivelSelecao
extends Control

export(String, FILE, "*.tscn") var nivel
export var numeroNivel: int = 1

onready var _textura = $Botao

onready var selecaoNivel = get_parent().get_parent()

func select_nivel():
	if not selecaoNivel.carregandoNivel:
		selecaoNivel.carregandoNivel = true
		var root = get_tree().get_root().get_node("Game")
		var current_scene = root.get_child(0)
		current_scene.queue_free()
		# 2. Load the new scene.
		var new_scene = ResourceLoader.load(nivel)

		# 3. Instance the new scene.
		current_scene = new_scene.instance()
		root.add_child(current_scene)
		selecaoNivel.carregandoNivel = false
		return current_scene

func atualizarNivel(nivelAtual: int):
	if nivelAtual > numeroNivel:
		_textura.set_texture(load("res://assets/art/ui/NivelCompletado.png"))
	elif nivelAtual >= numeroNivel:
		_textura.set_texture(load("res://assets/art/ui/NivelDesbloqueado.png"))

func _on_FaseBotao_pressed():
	select_nivel()

