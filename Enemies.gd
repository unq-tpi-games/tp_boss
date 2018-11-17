extends Node2D

# a través del tiempo y en distintas subclases,
# estas variables se irán modificando para agregar dificultad al juego
var speed = 100
var damage = 1

func _ready():
	#crear fuera de la cámara
	pass

#moverse hacia el punto del personaje mediante pathfinding & tweening
func attack():
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
