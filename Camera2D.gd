extends Camera2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var player

func _ready():
	player = get_node("/root/World").find_node("Char")
	pass

func _process(delta):
	if player.get_position().x >= get_position().x + 100:
		set_position(Vector2(player.get_position().x, get_position().y))
	if player.get_position().x < get_position().x - 100:
		set_position(Vector2(player.get_position().x, get_position().y))