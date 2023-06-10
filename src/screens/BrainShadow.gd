extends Sprite


onready var shadowAnimation:AnimationPlayer = $ShadowAnimation
# Called when the node enters the scene tree for the first time.
func _ready():
	shadowAnimation.play("shadow")
