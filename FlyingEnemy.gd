extends "res://Enemy.gd"

func set_ease(tween, pos):
	tween.interpolate_method(self, "attack", self.get_position(), pos, attack_duration, Tween.TRANS_CIRC, Tween.EASE_OUT)
	tween.start()

func obj_pos():
	return get_node("/root/World/Char").get_position()

func attack():
	#explota y causa daño en un radio de 10px
	pass

func _on_CollisionShape2D_tree_entered():
	pass # replace with function body
