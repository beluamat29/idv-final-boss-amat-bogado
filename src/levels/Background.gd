extends AudioStreamPlayer

func timeAboutToFinish():
	self.pitch_scale = 2
	self.volume_db = -20
