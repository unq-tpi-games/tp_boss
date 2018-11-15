extends Node
var tree = preload("res://resources/Tree.tscn")
var sheep = preload("res://resources/Animal.tscn")
var rock = preload("res://resources/Rock.tscn")
var wait_time = 500
var tower = preload("res://Tower.tscn")

func _ready():
	spawn_resources()
	$HUD.set_time_worker($Timer)
	set_process(true)
	pass

func _process(delta):
	wait_time -= 1
	if wait_time == 0:
		spawn_resources()
		wait_time = 500

#receiver: el que recibe el recurso.
#donor: el recurso o el que da un recurso.
func gather(receiver, donor):
	donor.use(donor.MAX_QUANTITY)
	receiver.receive(donor, donor.MAX_QUANTITY)

func check_daytime():
	if($Timer.is_it_day()):
		pass
		
	if( $Timer.is_it_night()):
		pass
		
func spawn_resources():
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

func spawn_tower():
	if $Char.stone >= 100:
		var newTower = tower.instance()
		newTower.set_scale(Vector2(0.3,0.3))
		newTower.position = Vector2(rand_range(500,1000),rand_range(50, 350))
		add_child(newTower)
		$Char.stone -= 100

func hud_set_wood(wood):
	$HUD.set_wood(wood)

func hud_set_food(food):
	$HUD.set_food(food)
	
func hud_set_rock(rock):
	$HUD.set_rock(rock)
	
func hud_set_life(health):
	$HUD.set_life(health)