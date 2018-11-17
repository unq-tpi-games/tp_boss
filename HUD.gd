extends CanvasLayer
var time_worker
onready var world = get_node("/root/World")

func _ready():
	$Info/goods/Wood.text = "Madera: 0"
	$Info/goods/Rock.text = "Piedra: 0"
	$Info/goods/Food.text = "Comida: 0"
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
#	if $Buttons/createTower.pressed:
#		world.spawn_tower()
	pass


func _on_createTower_pressed():
	print("creo nueva torre")
	
	world.set_spawn_tower()
	pass # replace with function body


func _on_createHouse_pressed():
	pass # replace with function body
