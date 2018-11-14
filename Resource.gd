extends Node

var available
var max_quantity

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func use(quant):
	available = available-quant

func _process(delta):
	#Ver cómo desaparecer a todos los hijos de los nodos
	if available == 0:
		hide()
		queue_free()
	
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	pass
