extends RigidBody2D
var direction = Vector2(0, -1)
var speed = 300
var level = 1
var fire_range = 200

func _ready():
	set_physics_process(true)
	# Set and rotate bullet sprite
	var sprite = get_node("Sprite")
	sprite.set_frame(level-1)
	var rad_angle = atan2(direction.x, -direction.y)
	set_rotation(rad_angle)

func _physics_process(delta):
	var pos = get_position()
	if pos.y > -fire_range:
		set_position(pos + (direction * speed * delta))
		#pos.y -= speed * delta
		#set_position(pos)
	else:
		#print("Bullet dies")
		queue_free()

