extends PanelContainer


func _ready() -> void:
	print_stack()
	print("If in doubt: %s" % sayProducerThing())
	print()


func sayProducerThing() -> String:
	return "I am a producer."
