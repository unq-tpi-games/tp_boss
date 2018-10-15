extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

const GRAVITY = 0.0
const WALK_SPEED = 200

var velocity = Vector2()

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
    move_and_slide(velocity, Vector2(0, -1))

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
