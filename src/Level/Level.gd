class_name Level
extends LevelClass

var collectedCoin = 0

# The "_" prefix is a convention to indicate that variables are private

onready var uiLixo = $CanvasLayer/TipoLixo
onready var caixaTexto = get_parent().get_node("Jogo/InterfaceLayer/Dialogo")

func _ready():
	uiLixo.setLixo(1)
	for child in get_children():
		if child is Player:
			var camera = child.get_node("Camera")
			camera.limit_left = LIMIT_LEFT
			camera.limit_top = LIMIT_TOP
			camera.limit_right = LIMIT_RIGHT
			camera.limit_bottom = LIMIT_BOTTOM


func _on_Fim_body_entered(body: Player):
	if body is Player:
		if collectedCoin >= 1:
			$Fim/Barreira.queue_free()
			body.terminarFase()
			yield(get_tree().create_timer(1), "timeout")
			trans.play_backwards("FadeIn")
			trans.connect("animation_finished", self, "fimNivel")
		else:
			caixaTexto.mostrarTextos(["Teste 1 2 3 4"])
func fimNivel(animation_name):
	if animation_name == "FadeIn":
		emit_signal("nivelAcabado")
		trans.play("FadeIn")
		uiLixo.queue_free()
		queue_free()
