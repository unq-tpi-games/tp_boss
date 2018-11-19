extends Node2D

var tween
var obj_pos
var attack_duration = 10 #default

func attack(pos):
	print(pos)
	#position = pos

func _ready():
	tween = Tween.new()
	add_child(tween)
	obj_pos = obj_pos()
	
#func _process(delta):
	set_ease(tween, obj_pos)
	attack(obj_pos)

