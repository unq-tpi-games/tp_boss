extends "res://Enemy.gd"

func set_ease(tween, pos):
	tween.interpolate_method(self, "move_to", self.get_position(), pos, attack_duration, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	tween.start()

func obj_pos():
	return get_node("/root/World/Char").get_position()

func attack():
	#explota y causa daño en un radio de 10px
	pass
