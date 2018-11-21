extends Node2D

var tween
var obj_pos
var attack_duration = 5 #default

var camera_x
var camera_y
var rand_index

onready var sprite = get_node('AnimatedSprite')
var velocity = Vector2()
var animation = 'normal'


#posicion inicial en base a lo que muestra la camara
func calculate_init_pos():
	camera_x = rand_range(1200,1250) #get_viewport().get_node("/root/World/HUD/Camera2D").get_camera_position()#get camera limits /2
	camera_y = rand_range(0,300)   #get_viewport().get_node("/root/World/HUD/Camera2D").get_camera_screen_center()#get camera limits /2
	return Vector2([-camera_x, camera_x][rand_index], camera_y)
	
func move_to(pos):
	set_position(pos)

func _ready():
	randomize()
	rand_index = randi()%1
	
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
	move_to(obj_pos)

func _process(delta):
	#TODO: usar signals
	if get_position() == obj_pos:
		attack()

func _on_Enemy_tree_entered():
	pass # replace with function body
