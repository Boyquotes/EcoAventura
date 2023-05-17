extends Panel


var coins_collected = 0

onready var coins_label = $Label


func _ready():
	coins_label.set_text(str(coins_collected))
	# Static types are necessary here to avoid warnings.
	var anim_sprite: AnimatedSprite = $AnimatedSprite
	anim_sprite.play()
#	var _player_path = get_node(@"../../../../Level/Player")
#	_player_path.connect("collect_coin", self, "_collect_coin")


func collect_coin():
	coins_collected += 1
	coins_label.set_text(str(coins_collected))
