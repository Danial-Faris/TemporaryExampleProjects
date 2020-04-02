extends Node2D
class_name LevelBase

func processLevelComponent(component) -> void:
	print("Processing component: %s %s" % [component.name, component])
