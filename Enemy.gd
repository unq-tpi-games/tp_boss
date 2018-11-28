extends Node2D

var tween
var obj_pos
var attack_duration = 5 #default

var camera_x
var camera_y
var rand_index

const MAX_HEALTH = 100
var health = MAX_HEALTH

onready var sprite = get_node('AnimatedSprite')
var velocity = Vector2()
var animation = 'normal'


func calculate_init_pos():
	camera_x = rand_range(1200,1250)
	camera_y = rand_range(0,600)
	#como el random no está siendo tal, agrego posiciones
	return Vector2([-10, camera_x, -10, camera_x][rand_index], camera_y)
	
func move_to(pos):
	set_position(pos)

func _ready():
	randomize()
	rand_index = randi()%4
	
	sprite.play('normal')
	
	tween = Tween.new()
	add_child(tween)
	set_position(calculate_init_pos())
	
	#TODO: en funcion?
	if get_position().x > 0:
		sprite.set_flip_h(true)
	
	obj_pos = obj_pos()
	
#func _process(delta):
	#TODO: la posicion deberia actualizarse con la pos del personaje,
	# el ataque tiene que estar definido en otra funcion
	set_ease(tween, obj_pos)

func _process(delta):
	if (position == obj_pos):
		queue_free()