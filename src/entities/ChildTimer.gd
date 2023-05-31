extends Timer

var waitingTime 
var randomNumberGenerator

func _ready():
	self.wait_time = generateRandomAmountOfTime()

func generateRandomAmountOfTime():
	randomNumberGenerator = RandomNumberGenerator.new()
	randomNumberGenerator.randomize()
	return randomNumberGenerator.randf_range(5, 10)
