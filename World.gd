extends Node
var tree = preload("res://resources/Tree.tscn")
var sheep = preload("res://resources/Animal.tscn")
var rock = preload("res://resources/Rock.tscn")
var wait_time = 500
var tower = preload("res://Tower.tscn")
const TOWER_CURSOR = "res://assets/img/tower_cursor.png"
var tower_cursor
var add_tower_mode = false
const ARROW_CURSOR = "res://assets/img/cursor-arrow-32x32.png"
var arrow_cursor 


func _ready():
	spawn_resources()
	tower_cursor = load(TOWER_CURSOR)
	arrow_cursor = load(ARROW_CURSOR)
	$HUD.set_time_worker($Timer)
	Input.set_custom_mouse_cursor(arrow_cursor)
	set_process(true)
	pass

func _process(delta):
	wait_time -= 1
	if wait_time == 0:
		spawn_resources()
		wait_time = 500

func _input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == BUTTON_LEFT and not event.is_pressed():
			# Letf mouse button up
			if add_tower_mode:
				spawn_tower(event.get_global_position())
				print("add tower")
				add_tower_mode = false
				Input.set_custom_mouse_cursor(arrow_cursor)

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



func set_spawn_tower():
	if $Char.stone >= 100:
		add_tower_mode = true
		Input.set_custom_mouse_cursor(tower_cursor)
	

func spawn_tower(pos):
	if $Char.stone >= 100:
		var newTower = tower.instance()
		newTower.set_scale(Vector2(0.2,0.2))
		newTower.position = pos
		#newTower.position = Vector2(rand_range(500,1000),rand_range(50, 350))
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