extends WorldEnvironment
var time_worker
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	#self.environment.set_ambient_light_energy(0)
	environment.adjustment_enabled = true
	pass


func set_time_worker(time_worker):
	self.time_worker = time_worker


func _process(delta):
	var hour = time_worker.get_hours()
	if(time_worker.is_it_emorning() || time_worker.is_it_evening()):
		environment.adjustment_brightness = 0.5
		environment.adjustment_saturation = 2
	if(time_worker.is_it_mnight()):
		environment.adjustment_brightness = 0.2
		environment.adjustment_saturation = 4
	if(time_worker.is_it_noon()):
		environment.adjustment_brightness = 1
		environment.adjustment_saturation = 1
	pass
