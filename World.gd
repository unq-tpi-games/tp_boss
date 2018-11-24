extends Node
var tree = preload("res://resources/Tree.tscn")
var sheep = preload("res://resources/Animal.tscn")
var rock = preload("res://resources/Rock.tscn")
var enemy = preload("res://FlyingEnemy.tscn")
var wolf = preload("res://Wolf.tscn")
var wait_time = 500
var tower = preload("res://Tower.tscn")
var hfence = preload("res://Fence.tscn")
var vfence = preload("res://VFence.tscn")
const TOWER_CURSOR = "res://assets/img/tower_cursor.png"
var tower_cursor
var add_tower_mode = false
const ARROW_CURSOR = "res://assets/img/cursor-arrow-32x32.png"
var arrow_cursor 

var add_vfence_mode = false
var add_hfence_mode = false

var inGameEnemies = 0
var waitEnemiesTime = 100

func _ready():
	spawn_resources()
	tower_cursor = load(TOWER_CURSOR)
	arrow_cursor = load(ARROW_CURSOR)
	$HUD.set_time_worker($Timer)
	$WorldEnvironment.set_time_worker($Timer)
	Input.set_custom_mouse_cursor(arrow_cursor)
	set_process(true)
	pass

func _process(delta):
	check_daytime()
	
	wait_time -= 1
	if wait_time == 0:
		spawn_resources()
		wait_time = 1000

func _input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == BUTTON_LEFT and not event.is_pressed():
			# Letf mouse button up
			if add_tower_mode:
				spawn_tower(event.get_global_position())
				print("add tower")
				add_tower_mode = false
				Input.set_custom_mouse_cursor(arrow_cursor)
			if add_vfence_mode:
				spawn_vfence(event.get_global_position())
				print("add vfence")
				add_vfence_mode = false
			if add_hfence_mode:
				spawn_hfence(event.get_global_position())
				print("add hfence")
				add_hfence_mode = false
			
			
#receiver: el que recibe el recurso.
#donor: el recurso o el que da un recurso.
func gather(receiver, donor):
	#donor.use(donor.MAX_QUANTITY)
	donor.use(10)
	#receiver.receive(donor, donor.MAX_QUANTITY)
	receiver.receive(donor,10)

func check_daytime():
	if $Timer.is_it_day():
		inGameEnemies = 0
		pass
		
	if $Timer.is_it_night() and $Timer.day_number > 0:
		waitEnemiesTime -= 1
		if waitEnemiesTime == 0:
			spawn_enemy()
			waitEnemiesTime = 100
		pass
		
func spawn_resources():
	randomize()
	var tree_resource
	var sheep_resource
	var rock_resource
	
	rock_resource = rock.instance()
	rock_resource.set_scale(Vector2(0.5,0.5))
	rock_resource.position = Vector2(rand_range(50,300),rand_range(300,500))
	add_child(rock_resource)
	
	tree_resource = tree.instance()
	tree_resource.set_scale(Vector2(0.5,0.5))
	tree_resource.position = Vector2(rand_range(350,600),rand_range(300,500))
	add_child(tree_resource)
	
	sheep_resource = sheep.instance()
	sheep_resource.position =  Vector2(rand_range(650,1000),rand_range(300,500))
	add_child(sheep_resource)

func spawn_enemy():
	if inGameEnemies < 10:
		add_child(enemy.instance())
		inGameEnemies += 1

func set_spawn_tower():
	if $Char.stone >= 100:
		add_tower_mode = true
		Input.set_custom_mouse_cursor(tower_cursor)
	

func set_create_vfence():
	if $Char.wood >=75:
		add_vfence_mode = true
		
func set_create_hfence():
	if $Char.wood >=75:
		add_hfence_mode = true
		
func spawn_tower(pos):
	if $Char.stone >= 100:
		var newTower = tower.instance()
		newTower.set_scale(Vector2(0.2,0.2))
		newTower.position = pos
		add_child(newTower)
		$Char.stone -= 100


func spawn_hfence(pos):
	var newhFence = hfence.instance()
	newhFence.position = pos
	add_child(newhFence)
	$Char.wood -= 75

func spawn_vfence(pos):
	var newvFence = vfence.instance()
	newvFence.position = pos
	add_child(newvFence)
	$Char.wood -= 75
	

func hud_set_wood(wood):
	$HUD.set_wood(wood)

func hud_set_food(food):
	$HUD.set_food(food)
	
func hud_set_rock(rock):
	$HUD.set_rock(rock)
	
func hud_set_life(health):
	$HUD.set_life(health)