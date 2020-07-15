extends "res://HBoxDisplayManager.gd"


const producerType = preload("res://Producer.gd")

export(String) var message := ""


func _ready() -> void:
	print_stack()
	
	prints(name, self)
	print("• My message: \"%s\"" % [message])
	
	var parent = get_parent()
	print("• MyParent: %s %s" % [parent.name, parent])
	print("• Is he a producer: %s" % [parent is producerType])
	print("• He says: \"%s\"" % [parent.sayProducerThing()])
	print()
