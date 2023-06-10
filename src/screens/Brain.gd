extends Sprite

onready var brainAnimation:AnimationPlayer = $BrainAnimation
# Called when the node enters the scene tree for the first time.
func _ready():
	brainAnimation.play("float")

