extends RichTextLabel

@export var speed: int = 3
@export var fade: bool = true

var time = 0
var sinTime = 0
var vis = false

func flashText():
	'''if !fade:
		if sinTime > 0:
			vis = true
		else:
			vis = false
	else:
	vis = true'''
	modulate.a = sinTime
	#print(modulate.a)
	visible = vis
		

func _physics_process(delta):
	visible = vis
	
	if vis == true:
		#while sinTime <= 1:
		time += delta
			#print(time)
		sinTime = sin(time*speed)
		flashText()
