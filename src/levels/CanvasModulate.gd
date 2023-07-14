extends CanvasModulate

const seconds_per_day:int = 30 * 25
const seconds_per_hour:int = 30

export(float, 0, 1) var brightness_night = 0.3
export(float, 0, 1) var brightness_day = 1.0
export(Color) var color_day = Color("ffffff")
export(Color) var color_dusk = Color("854646")
export(Color) var color_night = Color("27264c")

var dawn_time_in_seconds:int = 30 * 10
var dusk_time_in_seconds:int = 30 * 18

var sunset_start:int
var sunset_end:int

var color_gradient:Gradient = Gradient.new()

var color_add:Color = Color(0, 0, 0, 0)

export(NodePath) var clockNodePath
var clock

var current_color:Color = color_night

func _ready():
	clock = get_node(clockNodePath)

	sunset_start = dusk_time_in_seconds - 10
	sunset_end = dusk_time_in_seconds + 10
	
	color_gradient.add_point(0, color_day)
	color_gradient.add_point(0.5, color_day)
	color_gradient.add_point(float(sunset_start) / seconds_per_day, color_day)
	color_gradient.add_point(float(sunset_end) / seconds_per_day, color_night)
	color_gradient.add_point(0.99999, color_night)


func _on_Countdown_timeout():
	var time = clock.tiempoTotal
	
	current_color = color_gradient.interpolate(float(time) / seconds_per_day)
	
	color = current_color
	
	color += color_add
