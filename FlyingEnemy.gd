extends "res://Enemy.gd"

func set_ease(tween, pos):
	tween.interpolate_method(self, "attack", self.get_position(), pos, attack_duration, Tween.TRANS_CIRC, Tween.EASE_IN)
	tween.start()

func obj_pos():
	return get_node("/root/World/Char").get_position()