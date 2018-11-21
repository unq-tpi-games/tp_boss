extends Node2D

onready var sprite = get_node('sprite')
# a través del tiempo y en distintas subclases,
# estas variables se irán modificando para agregar dificultad al juego
var speed = 100
var damage = 1

var acceleration = Vector2()
var velocity = Vector2()
var animation = 'normal'

func _ready():
	#crear fuera de la cámara
	pass

#moverse hacia el punto del personaje mediante pathfinding & tweening
func attack():
	pass

func _process(delta):
	#sprite. check posotion
	if velocity.x > 0:
		sprite.set_flip_h(false)
	elif velocity.x < 0:
		sprite.set_flip_h(true)
	sprite.play(anim)
	"""
	# set anim
	if velocity.x == 0:
		animation = 'normal'
	else:
		animation = 'fast'
	"""
	
	#movement
	world = get_viewport().get_node("/root/world/map/nav")
	path = world.get_simple_path(position, to_move)


