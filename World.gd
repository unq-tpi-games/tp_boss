extends Node
var tree = preload("res://resources/Trees.tscn")
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var new_resource
	new_resource = tree.instance()
	new_resource.position =  Vector2(250, 100)
	add_child(new_resource)
	
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
