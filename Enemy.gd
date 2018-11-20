extends Node2D

var tween
var obj_pos
var attack_duration = 5 #default

#posicion inicial en base a lo que muestra la camara
func calculate_init_pos():
	camera_x = get_viewport().get_node("/root/World/Camera2D")#get camera limits /2
	camera_y = get_viewport().get_node("/root/World/Camera2D")#get camera limits /2
	
	return Vector2(rand([-camera_x, camera_x]), rand(-camera_y, camera_)) # ???

func move_to(pos):
	#print(pos)
	self.set_position(pos)

func _ready():
	tween = Tween.new()
	tween.set_position(calculate_init_pos)
	add_child(tween)
	obj_pos = obj_pos()
	
#func _process(delta):
	#TODO: la posicion deberia actualizarse con la pos del personaje
	set_ease(tween, obj_pos)
	move_to(obj_pos)

func _process(delta):
	#TODO: usar signals
	if get_position() == obj_pos:
		attack()