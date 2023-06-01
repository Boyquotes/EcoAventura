class_name Player
extends Actor

signal animacaoTerminada(nome)

const FLOOR_DETECT_DISTANCE = 20.0

export(String) var action_suffix = ""

onready var platform_detector = $PlatformDetector
onready var sprite = $AnimatedSprite
onready var sound_jump = $Jump
onready var timer = $Timer

var animacaoFim = false
var animacaoVoltar = false
var animacaoInicio = false

func _ready():
	# Static types are necessary here to avoid warnings.
	var camera: Camera2D = $Camera
	camera.custom_viewport = $"../.."
	yield(get_tree(), "idle_frame")
	camera.make_current()
	timer.connect("timeout", self, "terminarAnimacao")
	inicio()


# Physics process is a built-in loop in Godot.
# If you define _physics_process on a node, Godot will call it every frame.

# We use separate functions to calculate the direction and velocity to make this one easier to read.
# At a glance, you can see that the physics process loop:
# 1. Calculates the move direction.
# 2. Calculates the move velocity.
# 3. Moves the character.
# 4. Updates the sprite direction.
# 6. Updates the animation.

# Splitting the physics process logic into functions not only makes it
# easier to read, it help to change or improve the code later on:
# - If you need to change a calculation, you can use Go To -> Function
#   (Ctrl Alt F) to quickly jump to the corresponding function.
# - If you split the character into a state machine or more advanced pattern,
#   you can easily move individual functions.
func _physics_process(_delta):
	# Play jump sound
	var direction: Vector2
	var is_jump_interrupted = false
	if animacaoFim:
		direction = Vector2(-1, 0)
	elif animacaoVoltar or animacaoInicio:
		direction = Vector2(1, 0)
	else:
		if Input.is_action_just_pressed("jump" + action_suffix) and is_on_floor():
			sound_jump.play()

		direction = get_direction()

		is_jump_interrupted = Input.is_action_just_released("jump" + action_suffix) and _velocity.y < 0.0

	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)

	var snap_vector = Vector2.ZERO
	if direction.y == 0.0:
		snap_vector = Vector2.DOWN * FLOOR_DETECT_DISTANCE
	var is_on_platform = platform_detector.is_colliding()
	_velocity = move_and_slide_with_snap(
		_velocity, snap_vector, FLOOR_NORMAL, not is_on_platform, 4, 0.9, false
	)

	# When the character’s direction changes, we want to to scale the Sprite accordingly to flip it.
	# This will make Zeca face left or right depending on the direction you move.
	if direction.x != 0:
		sprite.play("caminhar")
		if direction.x > 0:
			if sprite.scale.x > 0: sprite.scale.x = -sprite.scale.x
		else:
			if sprite.scale.x < 0: sprite.scale.x = -sprite.scale.x 
	else:
		sprite.play("default")
		
	if _velocity.y and not is_on_floor() and not is_on_platform:
		sprite.play("pular")

func get_direction():
	return Vector2(
		Input.get_action_strength("move_right" + action_suffix) - Input.get_action_strength("move_left" + action_suffix),
		-1 if is_on_floor() and Input.is_action_just_pressed("jump" + action_suffix) else 0
	)


# This function calculates a new velocity whenever you need it.
# It allows you to interrupt jumps.
func calculate_move_velocity(
		linear_velocity,
		direction,
		speed,
		is_jump_interrupted
	):
	var velocity = linear_velocity
	velocity.x = speed.x * direction.x
	if direction.y != 0.0:
		velocity.y = speed.y * direction.y
	if is_jump_interrupted:
		# Decrease the Y velocity by multiplying it, but don't set it to 0
		# as to not be too abrupt.
		velocity.y *= 0.6
	return velocity

func terminarFase():
	animacaoFim = true

func voltar():
	animacaoVoltar = true
	timer.start(0.2)

func inicio():
	animacaoInicio = true
	timer.start(1.5)
	collision_mask = collision_mask - (collision_mask & 0b100000)

func terminarAnimacao():
	if animacaoInicio:
		collision_mask = collision_mask ^ 0b100000
		emit_signal("animacaoTerminada", "animacaoInicio")
	if animacaoVoltar:
		emit_signal("animacaoTerminada", "animacaoVoltar")
	if animacaoFim:
		emit_signal("animacaoTerminada", "animacaoFim")
	animacaoVoltar = false
	animacaoInicio = false
	animacaoFim = false

