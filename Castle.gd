extends StaticBody2D

var health = 100
var maxHealth = 100

func is_dead():
	return (health <= 0)
	
func damage(quantity):
	health -= quantity
	
func _process(delta):
	hud_update()
	
	
func hud_update():
	get_node("/root/World").hud_set_house_life(health)
	
	
func upgrade():
	maxHealth += 20
	health = max(maxHealth, health + 20)
	print(health)
	
func repair():
	if health + 5 <= maxHealth:
		health += 5
