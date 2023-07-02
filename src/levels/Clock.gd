extends Sprite

onready var animation: AnimationPlayer = $ClockAnimation

func _on_Time_time_about_to_finish():
	animation.play("highlight")
