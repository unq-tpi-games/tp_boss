extends Node

var available
const MAX_QUANTITY = 100

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
	pass

func _on_Resource_body_entered(body):
	get_node("/root/World").gather(body,self)