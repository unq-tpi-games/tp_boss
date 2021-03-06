extends KinematicBody2D

const GRAVITY = 0.0
const WALK_SPEED = 200
const MAX_HEALTH = 100

var velocity = Vector2()
var health = 100

var wood = 50
var food = 50
var stone = 50

var health_secs = 0
var food_secs = 0

func is_dead():
	return (health <= 0)

func _physics_process(delta):
    #velocity.y += delta * GRAVITY

	if Input.is_action_pressed("ui_left") and get_position().x >= 50:
		velocity.x = -WALK_SPEED
		$Sprite.play("walkLeft")
	elif Input.is_action_pressed("ui_right") and get_position().x <= get_viewport_rect().size.x - 50:
		velocity.x =  WALK_SPEED
		$Sprite.play("walkRight")
	elif Input.is_action_pressed("ui_up") and get_position().y >= 0:
		velocity.y = -WALK_SPEED
		$Sprite.play("walkUp")
	elif Input.is_action_pressed("ui_down") and get_position().y <= get_viewport_rect().size.y -50:
		velocity.y = WALK_SPEED
		$Sprite.play("walkDown")
	else:
		velocity.x = 0 
		velocity.y = 0
		$Sprite.play("idle")
		
	move_and_slide(velocity, Vector2(0, 0))

func _ready():
	set_scale(Vector2(30,30))
	pass

func damage(quantity):
	health -= quantity
	
func receive(obj, quantity):
	if obj.is_in_group("tree"):
		wood += quantity
		#get_node("/root/World").hud_set_wood(wood)
	if obj.is_in_group("animal"):
		food += quantity
		#get_node("/root/World").hud_set_food(food)
	if obj.is_in_group("rock"):
		stone += quantity
		#get_node("/root/World").hud_set_rock(stone)
		
#ojo: chequear bien lo de consumir 10 de comida
func _process(delta):
	hud_update()
	if(food_secs <30):
		food_secs += delta
	if(health_secs < 12):
		health_secs += delta
	if (health_secs >= 12):
		if (food <= 10):
			health-=1
		health_secs = 0
	if(food_secs >= 30):
		if (food >10):
			food -= 10
			health += 1
		food_secs = 0
	
	
func hud_update():
	get_node("/root/World").hud_set_life(health)
	get_node("/root/World").hud_set_food(food)
	get_node("/root/World").hud_set_wood(wood)
	get_node("/root/World").hud_set_rock(stone)
	
	