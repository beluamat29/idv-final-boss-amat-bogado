extends Sprite

onready var animation: AnimatedSprite = $AnimationPlayer

func _on_Time_end_sunset():
	animation.play("sunset")
