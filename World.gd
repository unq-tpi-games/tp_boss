extends Node
var tree = preload("res://resources/Tree.tscn")
var sheep = preload("res://resources/Animal.tscn")
var rock = preload("res://resources/Rock.tscn")
var wait_time = 500


func _ready():
	var tree_resource
	var sheep_resource
	var rock_resource
	
	rock_resource = rock.instance()
	rock_resource.set_scale(Vector2(0.5,0.5))
	rock_resource.position = Vector2(rand_range(0,600),rand_range(0,300))
	add_child(rock_resource)
	
	tree_resource = tree.instance()
	tree_resource.set_scale(Vector2(0.5,0.5))
	tree_resource.position = Vector2(rand_range(0,600),rand_range(0,500))
	add_child(tree_resource)
	
	sheep_resource = sheep.instance()
	sheep_resource.position =  Vector2(rand_range(0,600),rand_range(0,500))
	add_child(sheep_resource)
	pass

func _process(delta):
	wait_time -= 1
	if wait_time == 0:
		_ready()
		wait_time = 500

#receiver: el que recibe el recurso.
#donor: el recurso o el que da un recurso.
func gather(receiver, donor):
	donor.use(donor.MAX_QUANTITY)
	receiver.receive(donor, donor.MAX_QUANTITY)