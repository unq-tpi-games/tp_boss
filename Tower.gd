extends StaticBody2D
var attacking = 0
var fire_range = 200
var fire_next = 1
var time = 0.0
var level = 1

var health = 20

var fire_delta = 1.0/2.0

# Degrees per radian
const DEG_PER_RAD = 57.295779513

const arrow = "res://Arrow.tscn"

func _ready():
	set_physics_process(true)
	pass
	
	
func _physics_process(delta):
	time += delta
	#if enemy_at_range > 0:
	fire()

func damage(quantity):
	health -= quantity
	if health <= 0:
		queue_free()


func fire():
	if time > fire_next:
		var target_enemy = choose_target()
		if target_enemy == null:
			return
		var scene = load(arrow)
		var arr = scene.instance()
		#bullet.set_position(get_position())
		arr.direction = (target_enemy.get_global_position() - get_global_position()).normalized()
#		arr.level = level
		rotate_turret(arr.direction)
		add_child(arr)
		move_child(arr, 0)
		fire_next = time + fire_delta

func rotate_turret(direction):
	var rad_angle = atan2(direction.x, direction.y) - atan2(0, -1)
	var angle = (360 - int(rad_angle * DEG_PER_RAD)) % 360
	var sprite = get_node("Sprite")
	var hframes = sprite.get_hframes()
	var frame = int(round(angle / (360.0/hframes))) % hframes
	sprite.set_frame(hframes * (level-1 ) + frame)


func choose_target():
	var target = null
	var pos = get_global_position()
	for enemy in get_tree().get_nodes_in_group("enemies"):
		if pos.distance_to(enemy.get_global_position()) <= fire_range:
			if target == null or enemy.get_global_position().x > target.get_global_position().x:
				target = enemy
	return target


#func _on_Area2D_body_entered(body):
#	if body.is_in_group("enemies") && attacking == 0:
#		attack(body)
#		attacking+=1
#		pass
#	if body.name == "Char" :
#		pass
#