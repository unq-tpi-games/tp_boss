extends "res://Enemy.gd"

func set_ease(tween, pos):
	tween.interpolate_method(self, "move_to", self.get_position(), pos, attack_duration, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	tween.start()

func obj_pos():
	return Vector2(200,200)#get_node("/root/World/Char").get_position()

func attack(obj):
	obj.damage(10)
	#TODO:explota pero no se llega a mostrar por el queue_free.
	sprite.play('explosion')
	queue_free()

func getAttack(body):
	if body.is_in_group("arrow"):
		health -= 25
		if health == 0:
			queue_free()

func _on_Area2D_body_entered(body):
	if body.is_in_group("arrow"):
		getAttack(body)
		body.queue_free()
	if body.is_in_group("main_group"):
		attack(body)