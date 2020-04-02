extends Node2D

func _notification(what):
	match what:
		NOTIFICATION_PARENTED:
			var parent: Node = get_parent()
			print("%s %s parented to %s %s" % [self.name, self, parent.name, parent])
			if parent is LevelBase:
				var levelBase: LevelBase = parent
				levelBase.processLevelComponent(self)
