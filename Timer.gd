extends Node2D
var day_number = 0
var time_hours = 0
var time_minutes= 0

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_process(true)
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func get_time():
	return ((String(time_hours)+":"+String(time_minutes)))
	
func get_day_number():
	return String(day_number)

func is_AM():
	return (time_hours > 0 && time_hours <12)
	
func is_PM():
	return (time_hours <= 24 && time_hours >=12)

func is_it_day():
	return (time_hours >=7 && time_hours <=19)

func is_it_night():
	return ((time_hours >19 && time_hours <24) || (time_hours >=0 && time_hours <7))


func _process(delta):
	var secs = 0
	while (secs < 100000):
		secs += delta
	if (secs >= 100000):
		secs = 0
		time_minutes += 1
		if (time_minutes >=60):
			time_hours+=1
			time_minutes = 0
			if (time_hours >= 24):
				day_number +=1
				time_hours = 0
#	print(String(time_hours)+":"+String(time_minutes))
	pass
