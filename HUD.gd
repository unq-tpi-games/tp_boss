extends CanvasLayer
var time_worker

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	$Info/goods/Wood.text = "Madera"
	$Info/goods/Rock.text = "Piedra"
	$Info/goods/Food.text = "Comida"
	# Called when the node is added to the scene for the first time.
	# Initialization here
	
	pass

func set_time_worker(time_worker):
	self.time_worker = time_worker
	
func set_wood(wood):
	$Info/goods/Wood.text = "Madera: "+String(wood)



func set_rock(rock):
	$Info/goods/Rock.text = "Piedra: "+String(rock)
	
func set_food(food):
	$Info/goods/Food.text = "Comida: "+String(food)
	
func set_life(life):
	$Info/LIFE.value = life

func set_day_number():
	$Info/time/day_number.text = "Día número: "+time_worker.get_day_number()

func set_time():
	$Info/time/time.text = "Hora: "+time_worker.get_time()



func _process(delta):
	self.set_time()
	self.set_day_number()
	pass