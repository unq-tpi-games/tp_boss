extends KinematicBody2D

const GRAVITY = 0.0
const WALK_SPEED = 200
const MAX_HEALTH = 100

var velocity = Vector2()
var health = 100

var wood = 0
var food = 0
var stone = 0

func _physics_process(delta):
    #velocity.y += delta * GRAVITY

	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  WALK_SPEED
	elif Input.is_action_pressed("ui_up"):
		velocity.y = -WALK_SPEED
	elif Input.is_action_pressed("ui_down"):
		velocity.y = WALK_SPEED
	else:
		velocity.x = 0 
		velocity.y = 0
		
	move_and_slide(velocity, Vector2(0, 0))

func _ready():
	pass
	
func receive(obj, quantity):
	if obj.is_in_group("tree"):
		wood += quantity
	if obj.is_in_group("animal"):
		food += quantity
	if obj.is_in_group("rock"):
		stone += quantity
	print("wood: " + String(wood))
	print("stone: " + String(stone))
	print("food: " + String(food))