extends PopupMenu

onready var text_label: Label = $Label


func change_text(text):
	text_label.text = text
