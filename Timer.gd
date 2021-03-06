extends Node2D
var day_number = 0
var time_hours = 0
var time_minutes= 0
var secs = 0
var gameover =false
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
	return (is_it_emorning() || is_it_noon())
	#return time_hours >=7 && time_hours < 20
	#return ((time_hours >19 && time_hours <24) || (time_hours >=0 && time_hours <7))



func is_it_night():
	return (is_it_evening() || is_it_mnight())
	#return time_hours >= 20 or time_hours < 7

func is_it_emorning():
	return time_hours >= 6 && time_hours < 8

func is_it_noon():
	return time_hours >= 8 && time_hours <19

func is_it_evening():
	return time_hours >=19 && time_hours <=22
	
func is_it_mnight():
	return time_hours > 22 or time_hours < 6
	
	
func get_hours():
	return time_hours

func get_minutes():
	return time_minutes

func _process(delta):
	if(!gameover):
		if (secs < 0.01):
			secs += delta
		if (secs >= 0.01):
			secs = 0
			time_minutes += 1
			if (time_minutes >=60):
				time_hours+=1
				time_minutes = 0
				if (time_hours >= 24):
					day_number +=1
					time_hours = 0
	else:
		pass
	#print(String(time_hours)+":"+String(time_minutes))
	pass

func stop():
	gameover =true
	
func is_game_over():
	return gameover