extends Node

var available
const MAX_QUANTITY = 100
var being_used = false
var character

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func use(quant):
	available = available-quant
	self.update()
	
func update():
	$Status/available.text = "Disp: "+str(available)

func _process(delta):
	if available == 0:
		hide()
		queue_free()
	if(being_used):
		if Input.is_action_pressed("ui_accept"):
			get_node("/root/World").gather(character,self)
	pass

func _on_Area2D_body_entered(body):
	if body.name == "Char" :
		character = body
		being_used = true
		
func _on_Area2D_body_exited(body):
	being_used = false
	pass # replace with function body