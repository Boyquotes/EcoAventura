class_name Coin
extends Area2D
# Collectible that disappears when the player touches it.


onready var animation_player = $AnimationPlayer
onready var sprite = $sprite
enum tipoLixo { reciclavel, organico }

onready var level = get_parent().get_parent().get_parent()

export(tipoLixo) var teste = tipoLixo.organico
export(String, FILE, "*.png") var textura

# The Coins only detects collisions with the Player thanks to its collision mask.
# This prevents other characters such as enemies from picking up coins.
func _ready():
	var image = Image.new()
	image.load(textura)
	var texture = ImageTexture.new()
	texture.create_from_image(image)
	sprite.set_texture(texture)
#	if teste == tipoLixo.reciclavel:
#		get_node("latinha").visible = false
#	elif teste == tipoLixo.organico:
#		get_node("peixe").visible = false
#	else:
#		get_node("banana").visible = false
# When the player collides with a coin, the coin plays its "picked" animation.
# The animation takes cares of making the coin disappear, but also deactivates its
# collisions and frees it from memory, saving us from writing more complex code.
# Click the AnimationPlayer node to see the animation timeline.

func _on_body_entered(_body):
	if teste == tipoLixo.organico:
		if level.collectedCoin < 4:
			animation_player.play("picked")
			level.collectedCoin += 1
	elif teste == tipoLixo.reciclavel:
		if level.collectedCoin >= 4:
			animation_player.play("picked")
	if level.collectedCoin >= 4:
		level.uiLixo.setLixo(2)
#func _on_body_entered(_body):
#	animation_player.play("picked")
#	_body.emit_signal("collect_coin")
