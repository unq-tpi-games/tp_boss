extends Node
var tree = preload("res://resources/Tree.tscn")
var sheep = preload("res://resources/Animal.tscn")
var rock = preload("res://resources/Rock.tscn")
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var tree_resource
	var sheep_resource
	var rock_resource
	
	rock_resource = rock.instance()
	rock_resource.position = Vector2(275,200)
	add_child(rock_resource)
	
	tree_resource = tree.instance()
	tree_resource.position =  Vector2(250, 100)
	add_child(tree_resource)
	
	sheep_resource = sheep.instance()
	sheep_resource.position =  Vector2(400, 450)
	add_child(sheep_resource)
	
	$HUD.set_time_worker($Timer)
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
