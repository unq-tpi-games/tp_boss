extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	pass

func _on_Button_pressed():
	get_tree().change_scene("World.tscn")
	pass # replace with function body
