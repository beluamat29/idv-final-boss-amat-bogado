extends Sprite

onready var sprite: Sprite = $Sprite


func show_thought(sprite_texture):
	sprite.texture = load(sprite_texture)
	show()
	yield(get_tree().create_timer(6), "timeout")
	hide()
	
