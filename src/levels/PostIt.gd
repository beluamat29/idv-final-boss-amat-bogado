extends Sprite

onready var animation:AnimationPlayer = $PostItAnimation
onready var stars = $Stars

func playPostItAnimation():
	animation.play("highlight")

func _on_Level01_task_finished():
	playPostItAnimation()
	stars.animateStars()
