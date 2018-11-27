extends StaticBody2D

var health = 20

func damage(quantity):
	health -= quantity
	if health <= 0:
		queue_free()