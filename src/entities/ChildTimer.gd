extends Timer

func _ready():
	self.wait_time = generateRandomAmountOfTime()

func generateRandomAmountOfTime():
	var randomNumberGenerator = RandomNumberGenerator.new()
	randomNumberGenerator.randomize()
	return randomNumberGenerator.randf_range(5, 10)
	
func reset():
	self.wait_time = generateRandomAmountOfTime()
	self.start()
