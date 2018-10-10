extends "res://Resource.gd"

func _ready():
	available = 100
	$Status/available.text = "Disp: "+str(available)
	$Status/available.rect_position = Vector2(self.position.x, self.position.y+50)
	pass


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
